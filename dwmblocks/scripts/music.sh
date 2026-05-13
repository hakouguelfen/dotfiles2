#!/bin/bash

title=$(mpc current --format "%title%")
status=$(mpc status | awk 'NR==2 {print $1}')

barcolor="#B8D8E3"

playing="#88C0D0"
paused="#6C7086"
stopped="#45475A"

if [ "$status" = "[playing]" ]; then
    music="^c$playing^󰎇 $title 󰎇^d^"
else
    music="^c$paused^⏸ $title ⏸^d^"
fi

if [ -z "$title" ]; then
  echo "^c$stopped^󰎊 — no music — 󰎊^d^"
else
  current_percentage=$(mpc status | awk 'NR==2 { print $NF }' | tr -d '()%')

  # draw bar
  bar_width=10
  filled=$(( current_percentage * bar_width / 100 ))
  empty=$(( bar_width - filled ))

  bar=$(printf '▓%.0s' $(seq 1 $filled))$(printf '░%.0s' $(seq 1 $empty))

  # echo "$music [$bar] "
  echo " $music"
fi
