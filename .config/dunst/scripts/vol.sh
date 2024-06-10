#!/bin/env bash

msgTag="myvolume"
scriptName="volController"

wpctl set-volume -l 1.4 @DEFAULT_AUDIO_SINK@ "$@"
volume="$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print $NF * 100}')"
mute="$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print $NF}')"

if [[ $volume == 0 || "$mute" == "[MUTED]" ]]; then
    dunstify -a "$scriptName" -t 1500 -i audio-volume-muted -h string:x-dunst-stack-tag:$msgTag "Volume muted"
else
    dunstify -a "$scriptName" -t 1500 -h string:x-dunst-stack-tag:$msgTag -h int:value:"$volume" "Volume: ${volume}%" --icon=~/.local/share/icons/Colloid-grey/actions/16/player-volume.svg

fi

canberra-gtk-play -i audio-volume-change -d "$scriptName"
