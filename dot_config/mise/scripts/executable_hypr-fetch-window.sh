#!/usr/bin/env bash
set -euo pipefail

current_ws=$(hyprctl activeworkspace -j | jq -r '.id')

clients=$(hyprctl clients -j \
  | jq -r --arg ws "$current_ws" '
      .[]
      | select(.workspace.id != ($ws | tonumber))
      | "\(.address)\tWS:\(.workspace.id)\t\(.class)\t\(.title)"
    ')

if [ -z "$clients" ]; then
  echo "他のワークスペースにウィンドウがありません。"
  exit 0
fi

selection=$(echo "$clients" \
  | fzf \
      --delimiter=$'\t' \
      --with-nth=2.. \
      --preview-window=hidden \
      --prompt="Fetch window> " \
      --height=~50% \
      --layout=reverse)

if [ -z "$selection" ]; then
  exit 0
fi

addr=$(echo "$selection" | cut -f1)
hyprctl dispatch movetoworkspacesilent "${current_ws},address:${addr}" >/dev/null
hyprctl dispatch focuswindow "address:${addr}" >/dev/null
echo "Fetched: $(echo "$selection" | cut -f4)"
