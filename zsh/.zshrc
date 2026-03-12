export PATH="$PATH:$HOME/.local/bin:$HOME/.local/share/cargo/bin:$XDG_DATA_HOME/android/Sdk/platform-tools"

# ~~~~~~~~~~~~~~~~~~~~~~~ Main Opts ~~~~~~~~~~~~~~~~~~~~~~~
bindkey -e
setopt hist_ignore_space hist_ignore_dups hist_expire_dups_first append_history inc_append_history share_history
setopt auto_menu menu_complete
setopt autocd
setopt auto_param_slash
setopt dot_glob
setopt extended_glob

# ~~~~~~~~~~~~~~~~~~~~~~~ Completion ~~~~~~~~~~~~~~~~~~~~~~~
zmodload zsh/complist
autoload -Uz compinit
autoload -U colors && colors

if [[ -n $ZDOTDIR/.zcompdump(#qN.mh-24) ]]; then
  compinit
else
  compinit -C
fi

zstyle ':completion:*' menu select
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

zstyle ':completion:*:*:*:*:descriptions' format '%F{green}-- %d --%f'
zstyle ':completion:*:*:*:*:corrections' format '%F{yellow}!- %d (errors: %e) -!%f'

zstyle ':completion:*:dnf:*' group-name ''
zstyle ':completion:*:dnf:*' verbose yes

# ~~~~~~~~~~~~~~~~~~~~~~~ HISTORY ~~~~~~~~~~~~~~~~~~~~~~~
HISTCONTROL=ignoreboth
export LS_COLORS="$(vivid generate one-dark)"
eval "$(fzf --zsh)"
eval "$(zoxide init zsh)"

# ~~~~~~~~~~~~~~~~~~~~~~~ Plugins ~~~~~~~~~~~~~~~~~~~~~~~
function source_file(){
  [ -f "$1" ] && source "$1"
}
zsh_syntax_highlighting="$ZDOTDIR/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
zsh_autosuggestions="$ZDOTDIR/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"

source_file "$XDG_CONFIG_HOME/shell/alias"
source_file "$ZDOTDIR/.zsh_prompt"
source_file "$zsh_autosuggestions"
source_file "$zsh_syntax_highlighting"


. "$HOME/.local/share/../bin/env"

# pnpm
export PNPM_HOME="/home/hakou/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
