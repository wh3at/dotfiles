#!/usr/bin/env bash

set -euo pipefail

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
	unpushed="$(jj log "${merge_target}..@" --no-graph -T "change_id.short() ++ \"\\n\"")"
	if [ -n "${unpushed}" ]; then
		echo "error: workspace has unmerged changes:" >&2
		echo "${unpushed}" >&2
		echo "" >&2
		echo "use --force to delete anyway" >&2
		exit 1
	fi
fi

echo "forgetting workspace: ${current_workspace}"
jj workspace forget "${current_workspace}" 2>&1 || {
	echo "error: failed to forget workspace" >&2
	exit 1
}

echo "removing directory: ${workspace_dir_real}"
rm -rf "${workspace_dir_real}"

if [ -n "${ZELLIJ:-}" ]; then
	echo "closing zellij tab..."
	zellij action close-tab 2>&1 || echo "warning: failed to close tab" >&2
fi

echo "workspace cleaned: ${current_workspace}"
