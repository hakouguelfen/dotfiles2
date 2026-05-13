#!/bin/bash

device=$(bluetoothctl devices Connected | awk '{print $NF}')
mac=$(bluetoothctl devices Connected | awk '{print $(NF-1)}')
color="#83A598"

grey="#A9A9A9"
delim=" ^c$grey^|^d^ "

if [ -z "$device" ]; then
  echo "󰂲"
else
  battery=$(bluetoothctl info "$mac" | grep Battery | awk '{print $NF}' | tr -d '()')
  echo "$delim ^c$color^ ${device} (${battery}%)^d^"
fi
