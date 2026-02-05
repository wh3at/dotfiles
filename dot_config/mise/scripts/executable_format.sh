#!/usr/bin/env bash
set -euo pipefail

read -rp "Target path: " target_path
read -rp "Format type: " format_type

if [[ -z "$target_path" ]]; then
    echo "Error: Target path cannot be empty" >&2
    exit 1
fi

if [[ -z "$format_type" ]]; then
    echo "Error: Format type cannot be empty" >&2
    exit 1
fi

echo "Formatting '$target_path' with type '$format_type'..."
