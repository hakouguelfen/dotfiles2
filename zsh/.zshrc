# ~~~~~~~~~~~~~~~~~~~~~~~ Completion ~~~~~~~~~~~~~~~~~~~~~~~
zmodload zsh/complist
autoload -Uz compinit

if [[ -n $ZDOTDIR/.zcompdump(#qN.mh-24) ]]; then
  compinit
else
  compinit -C
fi

zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "$XDG_CACHE_HOME/zsh/zcompcache"

zstyle ':completion:*:*:*:*:descriptions' format '%F{green}-- %d --%f'
zstyle ':completion:*:*:*:*:corrections' format '%F{yellow}!- %d (errors: %e) -!%f'

# ~~~~~~~~~~~~~~~~~~~~~~~ HISTORY ~~~~~~~~~~~~~~~~~~~~~~~
HISTCONTROL=ignoreboth
setopt HIST_IGNORE_SPACE
setopt HIST_IGNORE_DUPS
setopt HIST_EXPIRE_DUPS_FIRST  # Expire duplicates first
setopt SHARE_HISTORY           # Share history across sessions

# ~~~~~~~~~~~~~~~~~~~~~~~ Key Bindings ~~~~~~~~~~~~~~~~~~~~~~~
setopt autocd
bindkey -e


# ~~~~~~~~~~~~~~~~~~~~~~~ Functions ~~~~~~~~~~~~~~~~~~~~~~~
function zsh_add_file(){
  [ -f "$1" ] && source "$1"
}


# ~~~~~~~~~~~~~~~~~~~~~~~ Plugins ~~~~~~~~~~~~~~~~~~~~~~~
zsh_syntax_highlighting="$ZDOTDIR/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
zsh_autosuggestions="$ZDOTDIR/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"

zsh_add_file "$XDG_CONFIG_HOME/shell/alias"
zsh_add_file "$ZDOTDIR/.zsh_prompt"
zsh_add_file "$ZDOTDIR/.zprofile"
zsh_add_file "$zsh_autosuggestions"
zsh_add_file "$zsh_syntax_highlighting"

eval "$(zoxide init zsh)"
