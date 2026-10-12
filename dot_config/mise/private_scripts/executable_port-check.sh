#!/usr/bin/env bash
set -euo pipefail

echo -n "Enter port number: "
read -r port

if ! [[ "$port" =~ ^[0-9]+$ ]]; then
    echo "Error: Invalid port number"
    exit 1
fi

result=$(ss -tlnp 2>/dev/null | grep ":${port} " || true)
if [[ -n "$result" ]]; then
    echo "$result"
else
    echo "Port $port is free"
fi
