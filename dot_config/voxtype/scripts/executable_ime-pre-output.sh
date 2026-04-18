#!/usr/bin/env bash

# Save current IM and switch to plain keyboard input before voxtype types text.
set -u

if ! command -v fcitx5-remote >/dev/null 2>&1; then
  exit 0
fi

if ! fcitx5-remote --check >/dev/null 2>&1; then
  exit 0
fi

runtime_dir="${XDG_RUNTIME_DIR:-/run/user/$(id -u)}"
state_dir="${runtime_dir}/voxtype"
state_file="${state_dir}/ime-prev"

mkdir -p "${state_dir}" 2>/dev/null || true

current_im="$(fcitx5-remote -n 2>/dev/null || true)"
if [ -n "${current_im}" ]; then
  printf '%s\n' "${current_im}" > "${state_file}" 2>/dev/null || true
fi

fcitx5-remote -s keyboard-jp >/dev/null 2>&1 || true

exit 0
