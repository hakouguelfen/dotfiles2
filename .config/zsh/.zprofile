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

[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"
