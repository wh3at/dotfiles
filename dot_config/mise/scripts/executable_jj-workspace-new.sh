#!/usr/bin/env bash

set -euo pipefail

workspace_name="${1:-}"

if [ -z "${workspace_name}" ]; then
	tty_state=""
	if tty_state="$(stty -g </dev/tty 2>/dev/null)"; then
		stty icrnl </dev/tty 2>/dev/null || true
	fi
	printf "Workspace name: "
	if ! IFS= read -r workspace_name </dev/tty; then
		if [ -n "${tty_state}" ]; then
			stty "${tty_state}" </dev/tty 2>/dev/null || true
		fi
		echo "failed to read workspace name from terminal" >&2
		exit 1
	fi
	if [ -n "${tty_state}" ]; then
		stty "${tty_state}" </dev/tty 2>/dev/null || true
	fi
fi

workspace_name="$(printf "%s" "${workspace_name}" | tr -d "\r")"
if [ -z "${workspace_name}" ]; then
	echo "workspace name is required" >&2
	exit 1
fi

case "${workspace_name}" in
	*"/"*|.*)
		echo "invalid workspace name: ${workspace_name}" >&2
		exit 1
		;;
esac

if ! repo_root="$(jj root 2>/dev/null)"; then
	echo "failed to resolve jj root. run this task inside a jj repository." >&2
	exit 1
fi

project_name="$(basename "${repo_root}")"
prefixed_workspace_name="${project_name}.${workspace_name}"
case "${workspace_name}" in
	"${project_name}".*)
		final_workspace_name="${workspace_name}"
		;;
	*)
		final_workspace_name="${prefixed_workspace_name}"
		;;
esac

workspace_parent="$(cd "${repo_root}/.." && pwd)"
workspace_dir_abs="${workspace_parent}/${final_workspace_name}"
jj workspace add "${workspace_dir_abs}" -r main

setup_script="${repo_root}/jj-workspace-setup.sh"
if [ -f "${setup_script}" ]; then
	(
		cd "${workspace_dir_abs}"
		if [ ! -x "${setup_script}" ]; then
			echo "error: workspace setup script is not executable: ${setup_script}" >&2
			exit 1
		fi
		JJ_DEFAULT_WORKSPACE_ROOT="${repo_root}" "${setup_script}"
	)
fi

if [ -n "${ZELLIJ:-}" ] && [ -n "${ZELLIJ_SESSION_NAME:-}" ]; then
	tab_names="$(zellij action query-tab-names 2>&1)" || {
		echo "warning: failed to query zellij tab names: ${tab_names}" >&2
		tab_names=""
	}
	if printf "%s\n" "${tab_names}" | grep -Fx -- "${final_workspace_name}" >/dev/null; then
		echo "zellij tab already exists: ${final_workspace_name}" >&2
		echo "hint: switch to it via zellij action go-to-tab-name \"${final_workspace_name}\"" >&2
	else
		if ! zellij action new-tab --name "${final_workspace_name}" --cwd "${workspace_dir_abs}" 2>&1; then
			echo "error: failed to create zellij tab: ${final_workspace_name}" >&2
			exit 1
		fi
		if ! zellij action go-to-tab-name "${final_workspace_name}" 2>&1; then
			echo "error: failed to focus zellij tab: ${final_workspace_name}" >&2
			exit 1
		fi
		workspace_dir_shell="$(printf "%q" "${workspace_dir_abs}")"
		layout_dump="$(zellij action dump-layout 2>&1)" || {
			echo "warning: failed to dump zellij layout: ${layout_dump}" >&2
			layout_dump=""
		}
		if printf "%s\n" "${layout_dump}" | grep -Eq "is_sync_panes[[:space:]]*=[[:space:]]*true"; then
			sync_was_enabled=1
		else
			sync_was_enabled=0
		fi
		if [ "${sync_was_enabled}" -eq 0 ]; then
			zellij action toggle-active-sync-tab 2>&1 || echo "warning: failed to enable sync mode" >&2
		fi
		zellij action write-chars "cd -- ${workspace_dir_shell}" 2>&1 || echo "warning: failed to write cd command" >&2
		zellij action write 10 2>&1 || echo "warning: failed to send enter key" >&2
		zellij action toggle-active-sync-tab 2>&1 || echo "warning: failed to disable sync mode" >&2
	fi
else
	echo "warning: not inside zellij, skipped tab creation" >&2
fi
