#!/bin/env bash

msgTag="myvolume"
scriptName="volController"

pactl set-sink-volume @DEFAULT_SINK@ "$@"
volume="$(pactl list sinks | grep '^[[:space:]]Volume' | head -n 1 | tail -n 1 | awk '{print $5}' | sed 's/[^0-9]*//g')"
mute="$(pactl list sinks | grep '^[[:space:]]Mute' | awk '{print $2}')"

if [[ $volume == 0 || "$mute" == "yes" ]]; then
    dunstify -a "$scriptName" -t 1500 -i audio-volume-muted -h string:x-dunst-stack-tag:$msgTag "Volume muted"
else
    dunstify -a "$scriptName" -t 1500 -h string:x-dunst-stack-tag:$msgTag -h int:value:"$volume" "Volume: ${volume}%" --icon=/usr/share/icons/Colloid-dark/actions/16/player-volume.svg

fi

canberra-gtk-play -i audio-volume-change -d "$scriptName"
