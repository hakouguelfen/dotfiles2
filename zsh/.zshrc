[ -f "$XDG_CONFIG_HOME/shell/alias" ] && source "$XDG_CONFIG_HOME/shell/alias"

# Use modern completion system
zmodload zsh/complist
autoload -U compinit && compinit
autoload -U colors && colors
compinit

## auto complete with case sensetive and  menu for selection
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

## main opts
setopt autocd
setopt PROMPT_SUBST
setopt histignorealldups sharehistory

# Keep 1000000 lines of history within the shell and save it to ~/.local/state/zsh/history:
HISTSIZE=1000000
SAVEHIST=1000000
HISTCONTROL=ignoreboth
HISTFILE="$XDG_STATE_HOME"/zsh/history

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

eval "$(zoxide init zsh)"

# autosuggestions
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh

source $HOME/.config/zsh/.zsh_prompt
