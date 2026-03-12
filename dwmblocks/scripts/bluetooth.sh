device=$(bluetoothctl devices Connected | awk '{print $NF}')

if [ -z "$device" ]; then
  echo " 󰂲"
else
  echo "  ${device}"
fi
