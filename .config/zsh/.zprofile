export PAGER="most"
export PATH=$PATH:~/.local/bin/scripts
export PATH=$PATH:~/.config/emacs/bin
# export MANPAGER="vim +Man!"
export EDITOR="vim"
#export BROWSER="librewolf"
export HISTCONTROL=ignoreboth
export LS_COLORS="$(vivid generate one-dark)"

export JAVA_HOME=/usr/lib/jvm/java-11-openjdk
export PATH=$PATH:/usr/lib/jvm/java-11-openjdk/bin

export PATH=$PATH:/opt/flutter/bin
export PATH=$PATH:/opt/hadoop/bin

export PATH=$PATH:~/miniconda3/bin

[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
# __conda_setup="$('/home/hakou/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
# if [ $? -eq 0 ]; then
#     eval "$__conda_setup"
# else
#     if [ -f "/home/hakou/miniconda3/etc/profile.d/conda.sh" ]; then
#         . "/home/hakou/miniconda3/etc/profile.d/conda.sh"
#     else
#         export PATH="/home/hakou/miniconda3/bin:$PATH"
#     fi
# fi
# unset __conda_setup
# <<< conda initialize <<<
