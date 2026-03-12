#!/usr/bin/env bash

DIRS=(
  "$HOME"
  "$HOME/Desktop"
  "$HOME/Desktop/Anzar"
  "$HOME/Desktop/Anzar/SDKs/"
)
SINGLE_DIRS=("$HOME/.config")

selected=$(
  {
    fd "${DIRS[@]}" --type=dir --max-depth=1 --full-path
    printf '%s\n' "${SINGLE_DIRS[@]}"
  } |
    sed "s|^$HOME/||; s|^$HOME$|.|" |
    sk --margin 10%
)

[[ $selected ]] && selected="$HOME/$selected"
[[ ! $selected ]] && exit 0

selected_name=$(basename "$selected" | tr . _)
if ! tmux has-session -t "$selected_name"; then
  tmux new-session -ds "$selected_name" -c "$selected"
  tmux select-window -t "$selected_name:1"
fi

tmux switch-client -t "$selected_name"
