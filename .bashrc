source "$HOME"/.bash_prompt
source /usr/share/git-core/contrib/completion/git-prompt.sh

shopt -s autocd
shopt -s progcomp

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

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
. "/home/hakou/.deno/env"
