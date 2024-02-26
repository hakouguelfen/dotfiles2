source "$HOME"/.bash_prompt

shopt -s autocd
eval "$(zoxide init bash)"

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

. "$HOME/.cargo/env"

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"

# My Aliases
alias l='lsd --group-directories-first'
alias ll='lsd -lAh --group-directories-first'
alias cls='clear'
alias mkdir='mkdir -pv'
alias cat='bat'

alias v='nvim'

alias get='sudo pacman -S'
alias del='sudo pacman -Rns'
alias update='sudo pacman -Syu'
alias updateParu='paru -Syu'

alias grep='grep --color'

alias rustbook='rustup doc --book'

up() {
  local d=""
  local limit="$1"

  # Default to limit of 1
  if [ -z "$limit" ] || [ "$limit" -le 0 ]; then
    limit=1
  fi

  for ((i = 1; i <= limit; i++)); do
    d="../$d"
  done

  # perform cd. Show error if cd fails
  if ! cd "$d"; then
    echo "Couldn't go up $limit dirs."
  fi
}

