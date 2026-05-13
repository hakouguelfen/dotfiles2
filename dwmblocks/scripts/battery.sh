#!/bin/bash

status="$(cat /sys/class/power_supply/BAT0/status)"
capacity="$(cat /sys/class/power_supply/BAT0/capacity)"

grey="#A9A9A9"
green="#A6E3A1"
amber="#F9E2AF"
pink="#F38BA8"
blue="#89B4FA"

delim="  ^c$grey^|^d^ "

if [[ "$status" == "Charging" ]]; then
  echo "^c$blue^ ${capacity}%$delim"
  exit
fi

if (($capacity < 20)); then
  # dunstify -a "battery" -h string:x-dunst-stack-tag:"battery" -u critical "ⴱⴰⵜⵔⵉ ⵀⵎⵉⵔ ["${capacity}"%]"
  echo "^c$pink^ ${capacity}%$delim"

elif (($capacity < 50)); then
  echo "^c$amber^ ${capacity}%$delim"

elif (($capacity < 100)); then
  echo "^c$green^ ${capacity}%$delim"
else
  echo "^c$green^ ${capacity}%$delim"
fi
