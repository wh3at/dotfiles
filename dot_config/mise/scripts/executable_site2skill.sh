#!/usr/bin/env bash
set -euo pipefail

read -rp "URL: " url
read -rp "SKILL_NAME: " skill_name

if [[ -z "$url" ]]; then
    echo "Error: URL cannot be empty" >&2
    exit 1
fi

if [[ -z "$skill_name" ]]; then
    echo "Error: SKILL_NAME cannot be empty" >&2
    exit 1
fi

uvx --from git+https://github.com/laiso/site2skill site2skill "$url" "$skill_name"
