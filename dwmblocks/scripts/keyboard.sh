#!/bin/bash 

keyboard=$(setxkbmap -query | grep "layout" | awk '{print $NF}')
grey="#A9A9A9"
delim=" ^c$grey^|^d^ "

if [[ "$keyboard" == "dz" ]]; then
  echo "󰌌 ⵣ $delim"
else
  echo "󰌌 $keyboard $delim"
fi
