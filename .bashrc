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

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/usr/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/usr/etc/profile.d/conda.sh" ]; then
        . "/usr/etc/profile.d/conda.sh"
    else
        export PATH="/usr/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

