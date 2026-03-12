export JAVA_HOME=/usr/lib/jvm/java-24-openjdk/

#   $JAVA_HOME/bin

# Editor and terminal settings
export EDITOR="nvim"
export VISUAL="nvim"
export TERM="tmux-256color"
export FZF_DEFAULT_OPTS="--border=bold --border=rounded --margin=3% --color=dark"
# export FZF_DEFAULT_OPTS="--bind 'enter:execute(nvim {} < /dev/tty)'"

# Color settings
export LS_COLORS="$(vivid generate one-dark)"
export MANPAGER="less -R --use-color -Dd+r -Du+b"

# XDG Base Directory Specification
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
export XDG_CACHE_HOME="${XDG_CACHE_HOME:-$HOME/.cache}"
export XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"
export XDG_STATE_HOME="${XDG_STATE_HOME:-$HOME/.local/state}"

# Zsh configuration directory
export ZDOTDIR="${ZDOTDIR:-$XDG_CONFIG_HOME/zsh}"
export HISTFILE="$XDG_CACHE_HOME/zsh/history"
export HISTSIZE=10000                   # Maximum events for internal history
export SAVEHIST=10000                   # Maximum events in history file

# Node.js
export NODE_REPL_HISTORY="$XDG_STATE_HOME/node_repl_history"
export NPM_CONFIG_INIT_MODULE="$XDG_CONFIG_HOME/npm/config/npm-init.js"
export NPM_CONFIG_CACHE="$XDG_CACHE_HOME/npm"
export NPM_CONFIG_TMP="$XDG_RUNTIME_DIR/npm"

# Python
export PYTHON_HISTORY=~/.local/share/python/history

# GTK
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc"

# Gradle
export GRADLE_USER_HOME="$XDG_DATA_HOME/gradle"

# Rust
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export RUSTUP_HOME="$XDG_DATA_HOME/rustup"

# Docker
export DOCKER_CONFIG="$XDG_CONFIG_HOME/docker"

# Android
export ANDROID_HOME="$XDG_DATA_HOME/android/sdk"
export ANDROID_USER_HOME="$XDG_DATA_HOME/android"

# X11
export XINITRC="$XDG_CONFIG_HOME/X11/xinitrc"

# Source Rust environment
[[ -f "$XDG_DATA_HOME/cargo/env" ]] && . "$XDG_DATA_HOME/cargo/env"

# Start X server on tty1
if [[ "$tty" = "/dev/tty1" && -z "$DISPLAY" && -x "$(command -v startx)" ]]; then
  exec startx "$XDG_CONFIG_HOME/X11/xinitrc" || echo "Failed to start X server"
fi


# PATHS
# path=(
#   $HOME/.local/bin
#   $HOME/.local/share/cargo/bin
#   $HOME/.config/herd-lite/bin
#   $HOME/.config/emacs/bin
#   "$XDG_DATA_HOME"/android/Sdk/platform-tools
#   /usr/lib64/mpich/bin
#   $JAVA_HOME/bin
#   $path
# )
# typeset -U path
