#!/usr/bin/env bash
set -euo pipefail

read -rp "host: " host
read -rp "remote port: " rport
read -rp "local port [${rport}]: " lport
lport="${lport:-$rport}"

LOG_FILE="$HOME/.config/mise/logs/pf-${host}-${lport}.log"
mkdir -p "$(dirname "$LOG_FILE")"

nohup ssh -N -L "${lport}:localhost:${rport}" "${host}" > "$LOG_FILE" 2>&1 &
PID=$!
echo "Port-forward started: PID=$PID, ${lport}:localhost:${rport} -> ${host}"
echo "Log file: $LOG_FILE"
