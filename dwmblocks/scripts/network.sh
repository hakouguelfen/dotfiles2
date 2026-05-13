#!/bin/bash 

net="$(cat /sys/class/net/wlp0s20f3/operstate)"
color="#81A1C1"
grey="#A9A9A9"
delim="^c$grey^|^d^ "

if [[ "$net" == "up" ]]; then
  echo "^c$color^󰤥  $delim"
else
  echo "󰖪  $delim"
fi
