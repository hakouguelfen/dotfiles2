#!/bin/bash 

status="$(cat /sys/class/power_supply/BAT0/status)"
capacity="$(cat /sys/class/power_supply/BAT0/capacity)"

if [[ "$status" == "Charging" ]]; then
  echo "${capacity}%  "
  exit
fi

if (( $capacity < 15 )); then
  echo "${capacity}% 󱉞 "
  dunstify -a "battery" -h string:x-dunst-stack-tag:"battery" -u critical "⚠️⚠️⚠️  battery low  ["${capacity}"%]"
elif (( $capacity < 20 )); then
  echo "${capacity}%  "
elif (( $capacity < 40 )); then
  echo "${capacity}%  "
elif (( $capacity < 60 )); then
  echo "${capacity}%  "
elif (( $capacity < 80 )); then
  echo "${capacity}%  "
elif (( $capacity < 100 )); then
  echo "${capacity}%  "
else
  echo "${capacity}%  "
fi
