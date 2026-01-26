#!/usr/bin/env bash
set -euo pipefail

LIST=$(ps -eo pid,lstart,cmd | grep -E "ssh.*-L" | grep -v grep | sort -n || true)

if [ -z "$LIST" ]; then
  echo "No active SSH port-forwards found."
  exit 0
fi

echo "Active SSH port-forwards:"
echo ""

index=1
while IFS= read -r line; do
  PID=$(echo "$line" | awk '{print $1}')
  START_TIME=$(echo "$line" | awk '{print $2" "$3" "$4" "$5" "$6}')
  CMD=$(echo "$line" | awk '{for(i=7;i<=NF;i++) printf "%s ", $i; printf "\n"}' | sed 's/ *$//')

  LPORT=$(echo "$CMD" | sed -n 's/.*-L \([0-9]*\):.*/\1/p')
  RPORT=$(echo "$CMD" | sed -n 's/.*:\([0-9]*\)[^0-9]*.*/\1/p')
  HOST=$(echo "$CMD" | sed -n 's/ssh.*-L [0-9]*:[^ ]* \([^ ]*\).*/\1/p')

  printf "[%d] PID: %-8s | %s:localhost:%s -> %s\n" "$index" "$PID" "$LPORT" "$RPORT" "$HOST"
  printf "    Command: %s\n" "$CMD"
  printf "    Started: %s\n" "$START_TIME"
  echo ""
  ((index++))
done <<< "$LIST"
