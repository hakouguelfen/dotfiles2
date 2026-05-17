#!/bin/bash
source "$(dirname "${BASH_SOURCE[0]}")/constants.sh"

status="$(cat /sys/class/power_supply/BAT0/status)"
capacity="$(cat /sys/class/power_supply/BAT0/capacity)"

delim="  ^c$grey^|^d^ "
if [[ "$status" == "Charging" ]]; then
  echo "^c$blue^ ${capacity}%$delim"
  exit
fi

if (($capacity < 20)); then
  # dunstify -a "battery" -h string:x-dunst-stack-tag:"battery" -u critical "ⴱⴰⵜⵔⵉ ⵀⵎⵉⵔ ["${capacity}"%]"
  echo "^c$red^ ${capacity}%$delim"

elif (($capacity < 50)); then
  echo "^c$orange^ ${capacity}%$delim"

elif (($capacity < 100)); then
  echo "^c$green^ ${capacity}%$delim"
else
  echo "^c$green^ ${capacity}%$delim"
fi
