export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
export XDG_STATE_HOME=$HOME/.local/state

export HISTFILE="$XDG_CONFIG_HOME"/zsh/history/.zsh_history

export NODE_REPL_HISTORY="$XDG_STATE_HOME"/node_repl_history
export NPM_CONFIG_INIT_MODULE="$XDG_CONFIG_HOME"/npm/config/npm-init.js
export NPM_CONFIG_CACHE="$XDG_CACHE_HOME"/npm
export NPM_CONFIG_TMP="$XDG_RUNTIME_DIR"/npm

export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc

export GRADLE_USER_HOME="$XDG_DATA_HOME"/gradle

export CARGO_HOME="$XDG_DATA_HOME"/cargo
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup

export DOCKER_CONFIG="$XDG_CONFIG_HOME"/docker

export ANDROID_HOME="$XDG_DATA_HOME"/android/sdk
export ANDROID_USER_HOME="$XDG_DATA_HOME"/android

export XINITRC="$XDG_CONFIG_HOME"/X11/xinitrc

export ZDOTDIR=$HOME/.config/zsh
. "$XDG_DATA_HOME/cargo/env"
