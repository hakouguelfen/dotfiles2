source $HOME/.config/zsh/.zsh_aliases
source $HOME/.config/zsh/.zsh_exports

setopt autocd
setopt PROMPT_SUBST

eval "$(zoxide init zsh)"

# Use modern completion system
autoload -Uz compinit
compinit

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history
setopt histignorealldups sharehistory

## auto complete with case sensetive and  menu for selection
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

git_status(){
  STATUS="$(git status 2> /dev/null)"

  if [[ $? -ne 0 ]]; then printf ""; return; fi

  modified=$(echo "${STATUS}" | grep -c "modified")
  untracked=$(echo "${STATUS}" | grep -c "Untracked")

  if [[ "$modified" -ne 0 ]] then printf "$modified!"; else printf ""; fi
  if [[ "$untracked" -ne 0 ]] then printf "$untracked!"; else printf ""; fi
}

git_branch(){
 git rev-parse --abbrev-ref HEAD 2> /dev/null
}


local top_left='%F{blue}%~'
local bottom_left='%F{green}❯ '

PROMPT=$'$top_left %F{green}$(git_branch) %F{yellow}$(git_status) \n$bottom_left'

