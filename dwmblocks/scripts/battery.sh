#!/bin/bash

status="$(cat /sys/class/power_supply/BAT0/status)"
capacity="$(cat /sys/class/power_supply/BAT0/capacity)"

if [[ "$status" == "Charging" ]]; then
  echo "${capacity}%  "
  exit
fi

if (($capacity < 15)); then
  echo "${capacity}% 󱉞 "
  # dunstify -a "battery" -h string:x-dunst-stack-tag:"battery" -u critical "ⴱⴰⵜⵔⵉ ⵀⵎⵉⵔ ["${capacity}"%]"
elif (($capacity < 20)); then
  echo " "
elif (($capacity < 40)); then
  echo " "
elif (($capacity < 60)); then
  echo " "
elif (($capacity < 80)); then
  echo " "
elif (($capacity < 100)); then
  echo " "
else
  echo " "
fi
