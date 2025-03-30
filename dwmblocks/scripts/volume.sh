#!/bin/env bash 

display_volume_icon() {
    vol="$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print $NF * 100}')"

    if [[ "$vol" -eq 0 ]]; then
        echo " "  # Muted icon
    elif (( vol <= 15 )); then
        echo " "  # Low volume icon
    elif (( vol <= 30 )); then
        echo " "  # Medium volume icon
    else
        echo " "  # High volume icon
    fi
}

nodeName="node.name.*alsa_output.usb-Generic_AB13X_USB_Audio_20210926172016-00.analog-stereo"
if pw-cli list-objects | grep -i "$nodeName" > /dev/null; then
  echo " "
else
  display_volume_icon 
fi

