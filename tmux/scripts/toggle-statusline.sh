#!/usr/bin/env bash

STATUS=$(tmux show status | cut -d' ' -f2)
if [[ "$STATUS" == "on" ]]; then
  tmux set-option status off
elif [[ "$STATUS" == "off" ]]; then
  tmux set-option status on
fi

