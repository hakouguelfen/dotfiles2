#!/bin/env bash 

grey="#6C7086"
low="#CDD6F4"
normal="#CBA6F7"
loud="#F38BA8"


display_volume_icon() {
    vol="$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print $NF * 100}')"

    if [[ "$vol" -eq 0 ]]; then
        echo "^c$grey^ 0%"  # Muted icon

    elif (( vol <= 15 )); then
        echo "^c$low^ ${vol}%"  # Low volume icon

    elif (( vol <= 30 )); then
        echo "^c$normal^ ${vol}%"  # Medium volume icon

    elif (( vol <= 50 )); then
        echo "^c$loud^ ${vol}%"  # Medium volume icon

    else
        echo "^c$loud^  ${vol}%"  # High volume icon
    fi
}

nodeName="node.name.*alsa_output.usb-Generic_AB13X_USB_Audio_20210926172016-00.analog-stereo"
if pw-cli list-objects | grep -i "$nodeName" > /dev/null; then
  echo " "
else
  echo "$(display_volume_icon)^d^"
fi

