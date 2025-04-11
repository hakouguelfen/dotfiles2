#!/bin/bash 

keyboard=$(setxkbmap -query | grep "layout" | awk '{print $NF}')


if [[ "$keyboard" == "dz" ]]; then
  echo " ⵣ"
else
  echo " $keyboard"
fi
