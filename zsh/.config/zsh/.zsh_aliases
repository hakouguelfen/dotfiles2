alias ls='lsd'
alias l='ls'
alias ll='ls -lAh'
alias lt='ls --tree'
alias cls='clear'
alias mkdir='mkdir -pv'
alias cat='bat'
alias du='dust'

alias v='nvim'

alias calc='python /usr/bin/calc.py'
alias torrent='transmission-gtk'
alias wifi='nm-connection-editor'
alias scanNet='sudo iwlist wlp3s0 scan | grep -i ssid'

alias get='sudo pacman -S'
alias del='sudo pacman -Rns'
alias update='sudo pacman -Syu'
alias updateParu='paru -Syu'

alias grep='grep --color'

alias svelte='npx degit sveltejs/template'
alias sveltekit='npm init svelte@next'
alias rustbook='rustup doc --book'
alias flutterGenerator='sh ~/Desktop/flutter-generator/flutterGenerator.sh'
alias nestGenerator='sh ~/Desktop/flutter-generator/nestGenerator.sh'

alias dmen='dmenu_run -fn "FiraCode:size=12" -l 20 -nb "#282c34" -nf "#cccccc" -sb "#d9e0ee" -sf "#1c1f24" -i -p "Hole world"'

# navigation
up () {
  local d=""
  local limit="$1"

  # Default to limit of 1
  if [ -z "$limit" ] || [ "$limit" -le 0 ]; then
    limit=1
  fi

  for ((i=1;i<=limit;i++)); do
    d="../$d"
  done

  # perform cd. Show error if cd fails
  if ! cd "$d"; then
    echo "Couldn't go up $limit dirs.";
  fi
}
