#!/bin/bash
source "$(dirname "${BASH_SOURCE[0]}")/constants.sh"

title=$(mpc current --format "%title%")
status=$(mpc status | awk 'NR==2 {print $1}')
timestamp=$(mpc status | awk 'NR==2 {print $3}')
current_percentage=$(mpc status | awk 'NR==2 { print $NF }' | tr -d '()%')

if [ "$status" = "[playing]" ]; then
    music="^c$playing^󰎇 $title 󰎇^d^"
else
    music="^c$grey^ $title  "
fi

if [ -z "$title" ]; then
  echo " ^c$dimmed^󰎊 — ⵓⵍⴰⵛ ⴰⵡⴰⵍ — 󰎊^d^"
else
  echo " $music ^c$paused^$timestamp^d^"
fi
