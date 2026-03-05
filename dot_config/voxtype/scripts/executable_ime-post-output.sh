#!/usr/bin/env bash

# Restore IM saved by ime-pre-output.sh after voxtype finishes typing.
set -u

if ! command -v fcitx5-remote >/dev/null 2>&1; then
  exit 0
fi

if ! fcitx5-remote --check >/dev/null 2>&1; then
  exit 0
fi

runtime_dir="${XDG_RUNTIME_DIR:-/run/user/$(id -u)}"
state_file="${runtime_dir}/voxtype/ime-prev"

if [ ! -f "${state_file}" ]; then
  exit 0
fi

saved_im="$(head -n 1 "${state_file}" 2>/dev/null || true)"

if [ -n "${saved_im}" ]; then
  fcitx5-remote -s "${saved_im}" >/dev/null 2>&1 || true
fi

rm -f "${state_file}" >/dev/null 2>&1 || true

exit 0
