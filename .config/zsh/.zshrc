setopt autocd
setopt PROMPT_SUBST

eval "$(zoxide init zsh)"

# Use modern completion system
autoload -Uz compinit
compinit

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history
setopt histignorealldups sharehistory

## auto complete with case sensetive and  menu for selection
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

# My Aliases
alias ls='lsd --group-directories-first'
alias l='lsd --group-directories-first'
alias ll='lsd -lAh --group-directories-first'
alias cls='clear'
alias mkdir='mkdir -pv'
alias cat='bat'
alias v='nvim'

alias download='yt-dlp -f bestvideo+bestaudio/best'

alias grep='grep --color'
alias rustbook='rustup doc --book'
#pandoc file.docx -o output.pdf --pdf-engine=weasyprint

source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh

source $HOME/.config/zsh/.zsh_prompt
source $HOME/.config/zsh/.zprofile


#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
. "/home/hakou/.deno/env"

# Add deno completions to search path
if [[ ":$FPATH:" != *":/home/hakou/.config/zsh/completions:"* ]]; then
  export FPATH="/home/hakou/.config/zsh/completions:$FPATH";
fi
