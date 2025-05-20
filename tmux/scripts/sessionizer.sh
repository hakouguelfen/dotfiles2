#!/usr/bin/env bash

SESSION=$(tmux list-session | cut -d: -f1 | fzf-tmux -w 50 -h 10)
if [ -n "$SESSION" ]; then
  tmux switch-client -t "$SESSION"
fi

