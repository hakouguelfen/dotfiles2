#!/bin/bash
source "$(dirname "${BASH_SOURCE[0]}")/constants.sh"

device=$(bluetoothctl devices Connected | awk '{print $NF}')
mac=$(bluetoothctl devices Connected | awk '{print $(NF-1)}')

delim=" ^c$grey^|^d^ "
if [ -z "$device" ]; then
  echo "$delim ^c$dimmed^󰂲 — ⵓⵍⴰⵛ ⴱⵍⵓⵜⵓⵜ — 󰂲 ^d^"
else
  battery=$(bluetoothctl info "$mac" | grep Battery | awk '{print $NF}' | tr -d '()')
  echo "$delim ^c$teal^ ${device} (${battery}%)^d^"
fi
