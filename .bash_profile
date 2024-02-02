export PAGER="most"
export PATH="$PATH":~/.local/bin/scripts
export PATH="$PATH":~/.config/emacs/bin
export MANPAGER="nvim +Man!"
export EDITOR="nvim"
export HISTCONTROL=ignoreboth
export GTK_THEME=Colloid-Nord:dark
# export LS_COLORS="$(vivid generate one-dark)"

[ -f ~/.bashrc ] && . "$HOME"/.bashrc
if [ "$(tty)" = "/dev/tty1" ]; then
    exec Hyprland
fi
