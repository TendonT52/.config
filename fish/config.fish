if status is-interactive
  # Commands to run in interactive sessions can go here
  # XDG paths
  export XDG_CONFIG_HOME=$HOME/.config
  export XDG_CACHE_HOME=$HOME/.cache
  export XDG_DATA_HOME=$HOME/.local/share

  # Homebrew setup
  eval "$(/opt/homebrew/bin/brew shellenv)"

  # Add Visual Studio Code (code)
  export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

  # Set theme to starship
  export STARSHIP_CONFIG=/Users/tendon/.config/fish/starship.toml
  starship init fish | source

  # Set zoom to run
  zoxide init fish | source

  # Set exa and aliases
  alias ll "exa -l -g --icons"
  alias lla "ll -a"

  # Set fish greeting
  set fish_greeting ""

  # Set vim like keybindings
  set -g fish_cursor_default     block 
  set -g fish_cursor_insert      line
  set -g fish_cursor_replace_one underscore
  set -g fish_cursor_visual      block
  set -g fish_key_bindings fish_key_bindings

  # Start tmux if not already running
  if not set -q TMUX
    set -g TMUX tmux new-session -d -s tendon
    eval $TMUX
    tmux attach-session -d -t tendon
  end

  echo -e "
  \e[1;31m _______\e[1;32m _______\e[1;33m _______\e[1;34m _______\e[1;35m _______\e[1;36m _______\e[1;37m _______
  \e[1;31m|_     _\e[1;32m|    ___\e[1;33m|    |  \e[1;34m|_     _\e[1;35m|    ___\e[1;36m|   __ \e[1;37m \  |   |
  \e[1;31m  |   | \e[1;32m|    ___\e[1;33m|       |\e[1;34m |   | \e[1;35m|    ___\e[1;36m|      \e[1;37m<       |
  \e[1;31m  |___| \e[1;32m|_______\e[1;33m|__|____|\e[1;34m |___| \e[1;35m|_______\e[1;36m|___|__\e[1;37m|__|_|__|
  "
end

