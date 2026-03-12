#!/usr/bin/env bash

SESSION=$(tmux list-session | cut -d: -f1 | fzf-tmux -w 50 -h 10 --prompt="Kill Session: ")
if [ -n "$SESSION" ]; then
  tmux kill-session -t "$SESSION"
fi
