[ -f "$XDG_CONFIG_HOME/shell/alias" ] && source "$XDG_CONFIG_HOME/shell/alias"
[ -f "$HOME/.bash_prompt" ] && source "$HOME/.bash_prompt"
source /usr/share/git-core/contrib/completion/git-prompt.sh

shopt -s autocd
shopt -s progcomp

eval "$(zoxide init bash)"

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
