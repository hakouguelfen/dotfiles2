export PAGER="most"
export PATH=$PATH:~/.local/bin/scripts
export PATH=$PATH:~/.config/emacs/bin
export PATH=$PATH:~/Android/Sdk/platform-tools/

export MANPAGER="nvim +Man!"
export EDITOR="nvim"
export HISTCONTROL=ignoreboth
export LS_COLORS="$(vivid generate one-dark)"

#export $(dbus-launch)

export PATH=$HOME/.local/bin:$PATH
export JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64
export PATH=$PATH:/usr/lib/jvm/java-17-openjdk-amd64/bin

export PATH=$PATH:/opt/flutter/bin

[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"
. "$HOME/.cargo/env"
