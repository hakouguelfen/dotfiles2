#!/bin/env bash 

display_volume_icon() {
    vol="$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print $NF * 100}')"

    if [[ "$vol" -eq 0 ]]; then
        echo " "  # Muted icon
    elif (( vol <= 15 )); then
        echo ""  # Low volume icon
    elif (( vol <= 30 )); then
        echo ""  # Medium volume icon
    else
        echo " "  # High volume icon
    fi
}

headphone="$(pw-dump | jq -r '.[] | select(.id == 40) | .info.params.EnumRoute[] | select(.name == "analog-output-headphones") | .available')"

if [[ $headphone == "no" ]]; then
  display_volume_icon 
else
  echo " "
fi
