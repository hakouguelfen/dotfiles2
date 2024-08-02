export PAGER="most"
export PATH="$PATH":~/.local/bin/scripts
export PATH="$PATH":~/miniconda3
export PATH="$PATH":~/.config/emacs/bin
export MANPAGER="nvim +Man!"
export EDITOR="nvim"
export HISTCONTROL=ignoreboth
export GTK_THEME=Colloid-Nord:dark

export LS_COLORS="$(vivid generate one-dark)"

[ -f ~/.bashrc ] && . "$HOME"/.bashrc
if [ "$(tty)" = "/dev/tty1" ]; then
    exec dwm
fi

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/hakou/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/hakou/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/hakou/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/hakou/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
. "$HOME/.cargo/env"
