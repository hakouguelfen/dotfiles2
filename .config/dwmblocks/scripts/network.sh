#!/bin/bash 

net="$(cat /sys/class/net/wlp0s20f3/operstate)"

if [[ "$net" == "up" ]]; then
  echo " "
else
  echo "Disconnected 󰖪 "
fi
