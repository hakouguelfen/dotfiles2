device=$(bluetoothctl devices Connected | awk '{print $NF}')
mac=$(bluetoothctl devices Connected | awk '{print $(NF-1)}')


if [ -z "$device" ]; then
  echo " 󰂲"
else
  battery=$(bluetoothctl info "$mac" | grep Battery | awk '{print $NF}' | tr -d '()')
  echo "  ${device} (${battery}%)"
fi
