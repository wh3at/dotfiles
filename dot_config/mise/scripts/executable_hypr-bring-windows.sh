#!/usr/bin/env bash

monitors=$(hyprctl monitors -j)
clients=$(hyprctl clients -j)

moved=0

while IFS= read -r client; do
  addr=$(echo "$client" | jq -r '.address')
  x=$(echo "$client" | jq -r '.at[0]')
  y=$(echo "$client" | jq -r '.at[1]')
  title=$(echo "$client" | jq -r '.title')
  width=$(echo "$client" | jq -r '.size[0]')
  height=$(echo "$client" | jq -r '.size[1]')
  
  is_offscreen=1
  
  while IFS= read -r monitor; do
    mx=$(echo "$monitor" | jq -r '.x')
    my=$(echo "$monitor" | jq -r '.y')
    mw=$(echo "$monitor" | jq -r '.width')
    mh=$(echo "$monitor" | jq -r '.height')
    
    if [ "$x" -ge "$mx" ] && [ "$x" -lt $((mx + mw)) ] && \
       [ "$y" -ge "$my" ] && [ "$y" -lt $((my + mh)) ]; then
      is_offscreen=0
      break
    fi
  done < <(echo "$monitors" | jq -c '.[]')
  
  if [ "$is_offscreen" -eq 1 ]; then
    first_mon=$(echo "$monitors" | jq -c '.[0]')
    mx=$(echo "$first_mon" | jq -r '.x')
    my=$(echo "$first_mon" | jq -r '.y')
    mw=$(echo "$first_mon" | jq -r '.width')
    mh=$(echo "$first_mon" | jq -r '.height')
    
    new_x=$((mx + mw / 2 - width / 2))
    new_y=$((my + mh / 2 - height / 2))
    
    hyprctl dispatch movewindowpixel "exact $new_x $new_y,address:$addr" >/dev/null 2>&1
    echo "Moved: $title"
    ((moved++))
  fi
done < <(echo "$clients" | jq -c '.[]')

if [ "$moved" -eq 0 ]; then
  echo "No off-screen windows found"
else
  echo "Total: $moved window(s) moved"
fi
