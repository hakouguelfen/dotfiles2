#!/bin/bash 
source "$(dirname "${BASH_SOURCE[0]}")/constants.sh"

net="$(cat /sys/class/net/wlp0s20f3/operstate)"
delim="^c$grey^|^d^ "

if [[ "$net" == "up" ]]; then
  echo "^c$teal^󰤥 ^d^ $delim"
else
  echo "^c$dimmed^󰖪 ^d^ $delim"
fi
