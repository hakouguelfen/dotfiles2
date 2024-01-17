source "$HOME"/.bash_aliases
source "$HOME"/.bash_exports
source "$HOME"/.bash_prompt

eval "$(zoxide init bash)"

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

. "$HOME/.cargo/env"

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"

