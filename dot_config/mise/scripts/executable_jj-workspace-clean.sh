#!/usr/bin/env bash

set -euo pipefail

delete_tombstone() {
	local tombstone_dir="$1"
	local safe_cwd="$2"
	local attempt

	cd "${safe_cwd}"

	for attempt in $(seq 1 20); do
		if rm -rf -- "${tombstone_dir}" 2>/dev/null && [ ! -e "${tombstone_dir}" ]; then
			return 0
		fi
		sleep 0.25
	done

	rm -rf -- "${tombstone_dir}"
	[ ! -e "${tombstone_dir}" ]
}

should_close_zellij_tab() {
	[ -n "${ZELLIJ:-}" ] &&
	[ -n "${ZELLIJ_SESSION_NAME:-}" ] &&
	[ -t 0 ] &&
	[ -t 1 ]
}

if [ "${1:-}" = "--delete-tombstone" ]; then
	tombstone_dir="${2:-}"
	safe_cwd="${3:-}"

	if [ -z "${tombstone_dir}" ] || [ -z "${safe_cwd}" ]; then
		echo "error: --delete-tombstone requires tombstone_dir and safe_cwd" >&2
		exit 1
	fi

	delete_tombstone "${tombstone_dir}" "${safe_cwd}"
	exit 0
fi

force_mode=""
if [ "${1:-}" = "--force" ]; then
	force_mode="--force"
	shift
elif [ "${0:-}" = "--force" ]; then
	force_mode="--force"
fi

if ! jj root >/dev/null 2>&1; then
	echo "error: not inside a jj repository" >&2
	exit 1
fi

current_change_id="$(jj log -r "@" --no-graph -T "change_id.short(8)")"
if [ -z "${current_change_id}" ]; then
	echo "error: failed to get current change id" >&2
	exit 1
fi

current_workspace="$(jj workspace list | grep -E ": ${current_change_id}(\\s|$)" | cut -d: -f1)"
if [ -z "${current_workspace}" ]; then
	echo "error: failed to determine current workspace for change ${current_change_id}" >&2
	exit 1
fi

if [ "${current_workspace}" = "default" ]; then
	echo "error: cannot clean default workspace" >&2
	exit 1
fi

repo_root="$(jj root)"
workspace_parent="$(cd "${repo_root}/.." && pwd)"

if [ -z "${workspace_parent}" ]; then
	echo "error: workspace_parent is empty" >&2
	exit 1
fi

case "${current_workspace}" in
	*..* | */* | *\\*)
		echo "error: invalid workspace name (suspicious characters): ${current_workspace}" >&2
		exit 1
		;;
esac

workspace_dir_abs="${workspace_parent}/${current_workspace}"

workspace_parent_real="$(cd "${workspace_parent}" && pwd -P)"
workspace_dir_real="$(cd "${workspace_dir_abs}" 2>/dev/null && pwd -P || echo "")"
default_workspace_name="${current_workspace%%.*}"
default_repo_root="${workspace_parent}/${default_workspace_name}"
delete_cwd="${workspace_parent_real}"

if [ -z "${workspace_dir_real}" ]; then
	echo "error: workspace directory not found: ${workspace_dir_abs}" >&2
	exit 1
fi

case "${workspace_dir_real}/" in
	"${workspace_parent_real}/"*)
		;;
	*)
		echo "error: workspace directory escapes parent: ${workspace_dir_real}" >&2
		exit 1
		;;
esac

if [ "${default_workspace_name}" = "${current_workspace}" ]; then
	echo "error: failed to derive default workspace root from workspace name: ${current_workspace}" >&2
	exit 1
fi

if ! jj -R "${default_repo_root}" root >/dev/null 2>&1; then
	echo "error: failed to resolve default workspace root: ${default_repo_root}" >&2
	exit 1
fi

delete_cwd="$(cd "${default_repo_root}" && pwd -P)"

if [ "${force_mode}" != "--force" ]; then
	echo "fetching latest from remote..."
	jj git fetch --quiet 2>&1 || {
		echo "error: failed to fetch from remote" >&2
		exit 1
	}

	if jj log -r "main@origin" --no-graph -T "change_id.short()" >/dev/null 2>&1; then
		merge_target="main@origin"
	elif jj log -r "main" --no-graph -T "change_id.short()" >/dev/null 2>&1; then
		merge_target="main"
	else
		echo "error: neither main@origin nor main could be resolved" >&2
		echo "hint: run jj bookmark list --all-remotes and verify main tracking" >&2
		exit 1
	fi

	echo "merge check target: ${merge_target}"
	unpushed="$(jj log -r "${merge_target}..@-" --no-graph -T "change_id.short() ++ \"\\n\"")"
	if [ -n "${unpushed}" ]; then
		echo "error: workspace has unmerged changes:" >&2
		echo "${unpushed}" >&2
		echo "" >&2
		echo "use --force to delete anyway" >&2
		exit 1
	fi

	if ! jj diff --from "@-" --to "@" --quiet; then
		echo "error: workspace has uncommitted changes:" >&2
		jj diff --from "@-" --to "@" --summary >&2
		echo "" >&2
		echo "use --force to delete anyway" >&2
		exit 1
	fi
fi

timestamp="$(date +%Y%m%d%H%M%S)"
tombstone_dir_abs="${workspace_parent}/.jj-cleaning-${current_workspace}-${timestamp}-$$"

echo "parking workspace directory: ${workspace_dir_real} -> ${tombstone_dir_abs}"
mv "${workspace_dir_real}" "${tombstone_dir_abs}"

cd "${delete_cwd}"

echo "forgetting workspace: ${current_workspace}"
jj -R "${default_repo_root}" workspace forget "${current_workspace}" 2>&1 || {
	if [ ! -e "${workspace_dir_real}" ] && [ -e "${tombstone_dir_abs}" ]; then
		mv "${tombstone_dir_abs}" "${workspace_dir_real}" 2>/dev/null || true
	fi
	echo "error: failed to forget workspace" >&2
	exit 1
}

echo "removing parked directory: ${tombstone_dir_abs}"

if should_close_zellij_tab; then
	nohup "${0}" --delete-tombstone "${tombstone_dir_abs}" "${delete_cwd}" >/tmp/jj-workspace-clean.log 2>&1 &
	echo "workspace detached: ${current_workspace}"
	echo "closing zellij tab to stop workspace-local processes..."
	zellij action close-tab 2>&1 || echo "warning: failed to close tab; cleanup continues in background" >&2
	exit 0
fi

if ! delete_tombstone "${tombstone_dir_abs}" "${delete_cwd}"; then
	echo "error: failed to remove parked directory: ${tombstone_dir_abs}" >&2
	echo "hint: some process may still be writing there; remove it manually after stopping the process" >&2
	exit 1
fi

echo "workspace cleaned: ${current_workspace}"
