#!/usr/bin/env bash
set -euo pipefail

read -rp "process name: " pattern

if [[ -z "$pattern" ]]; then
  echo "No pattern provided."
  exit 1
fi

# pgrepでマッチするPIDを取得
pids=$(pgrep -i "$pattern" || true)
if [[ -z "$pids" ]]; then
  echo "No processes matching: $pattern"
  exit 0
fi

echo ""
echo "Listening ports for processes matching '$pattern':"
echo ""

for pid in $pids; do
  cmd=$(ps -p "$pid" -o args= 2>/dev/null || echo "?")
  ports=$(ss -tlnp 2>/dev/null | awk -v pid="pid=$pid" '$0 ~ pid {split($4, a, ":"); print a[length(a)]}' | sort -un | paste -sd,)
  if [[ -n "$ports" ]]; then
    printf "PID %-7s  port %s\n" "$pid" "$ports"
    printf "  %s\n\n" "$cmd"
  fi
done
