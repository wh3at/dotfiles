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
  CMD=$(echo "$line" | awk '{for(i=7;i<=NF;i++) printf "%s ", $i; printf "\n"}' | sed 's/ *$//')

  LPORT=$(echo "$CMD" | sed -n 's/.*-L \([0-9]*\):.*/\1/p')
  RPORT=$(echo "$CMD" | sed -n 's/.*:\([0-9]*\)[^0-9]*.*/\1/p')
  HOST=$(echo "$CMD" | sed -n 's/ssh.*-L [0-9]*:[^ ]* \([^ ]*\).*/\1/p')

  printf "[%d] PID: %-8s | %s:localhost:%s -> %s\n" "$index" "$PID" "$LPORT" "$RPORT" "$HOST"
  ((index++))
done <<< "$LIST"

echo ""
read -rp "Enter number to stop (or press Ctrl+C to cancel): " CHOICE

if ! [[ "$CHOICE" =~ ^[0-9]+$ ]] || [ "$CHOICE" -lt 1 ] || [ "$CHOICE" -ge "$index" ]; then
  echo "Invalid selection."
  exit 1
fi

selected_line=$(echo "$LIST" | sed -n "${CHOICE}p")
PID=$(echo "$selected_line" | awk '{print $1}')

kill "$PID"
echo "Port-forward stopped (PID: $PID)"
