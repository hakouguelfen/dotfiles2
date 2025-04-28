#!/bin/env bash

tag="myvolume"
scriptName="Volume Controller"

wpctl set-mute @DEFAULT_SINK@ toggle
volume="$(wpctl get-volume @DEFAULT_SINK@ | awk '{print $NF * 100}')"
mute="$(wpctl get-volume @DEFAULT_SINK@ | awk '{print $NF}')"

if [[ $volume == 0 || "$mute" == "[MUTED]" ]]; then
    dunstify -a "$scriptName" -t 1500 -i custom/volume-muted -h string:x-dunst-stack-tag:$tag "Volume muted"
else
    dunstify -a "$scriptName" -t 1500 -i custom/volume-high -h string:x-dunst-stack-tag:$tag "Volume: " -h int:value:"$volume" 
fi

pkill -RTMIN+10 dwmblocks
