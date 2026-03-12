#!/usr/bin/env bash

SESSION=$(tmux list-session | cut -d: -f1 | fzf-tmux -w 55 -h 15 --prompt="Select Session: ")
if [ -n "$SESSION" ]; then
  tmux switch-client -t "$SESSION"
fi
