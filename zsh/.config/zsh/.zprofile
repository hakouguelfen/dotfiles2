export PAGER="most"
export PATH=$PATH:~/.local/bin/scripts
export PATH=$PATH:~/.config/emacs/bin
export MANPAGER="nvim +Man!"
export EDITOR="nvim"
export HISTCONTROL=ignoreboth
export LS_COLORS="$(vivid generate one-dark)"
export GTK_THEME=Colloid-Nord:dark

[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"
