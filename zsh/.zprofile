# Color settings
export LS_COLORS="$(vivid generate one-dark)"
export MANPAGER="less -R --use-color -Dd+r -Du+b"

# Tool-specific settings
export PYTHON_HISTORY=~/.local/share/python/history
export JAVA_HOME=/usr/lib/jvm/java-21-openjdk

# PATH modifications
path=(
  $HOME/.local/bin
  $HOME/.local/share/cargo/bin
  $HOME/.config/herd-lite/bin
  $HOME/.config/emacs/bin
  "$XDG_DATA_HOME"/android/Sdk/platform-tools
  /usr/lib64/mpich/bin
  /opt/flutter/bin
  $JAVA_HOME/bin
  $path
)
typeset -U path

# Source Rust environment
[[ -f "$XDG_DATA_HOME/cargo/env" ]] && . "$XDG_DATA_HOME/cargo/env"

# Start X server on tty1
if [[ "$tty" = "/dev/tty1" && -z "$DISPLAY" && -x "$(command -v startx)" ]]; then
  exec startx "$XDG_CONFIG_HOME/X11/xinitrc" || echo "Failed to start X server"
fi
