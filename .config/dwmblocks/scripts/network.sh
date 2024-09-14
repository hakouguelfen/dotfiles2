#!/bin/bash 

net="$(cat /sys/class/net/w*/operstate)"

if [[ "$net" == "up" ]]; then
  echo "Connected   "
else
  echo "Disconnected 󰖪 "
fi
