#!/bin/bash 

volume="$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print $NF * 100}')"

if [[ $volume == 0 || "$mute" == "[MUTED]" ]]; then
  echo " [Muted] "
else
  echo "󰕾 ${volume}"
fi

