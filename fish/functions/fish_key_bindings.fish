function fish_key_bindings
  # Vi bindings
  fish_vi_key_bindings
  set -g fish_escape_delay_ms 10

  # Set the cursor shapes for the different vi modes.
  set -g fish_cursor_default     block 
  set -g fish_cursor_insert      line
  set -g fish_cursor_replace_one underscore
  set -g fish_cursor_visual      block

  # Set binding 

  # Unbind tab
  bind --erase --preset \t
  bind --erase --preset -M insert \t
  bind --erase --preset -M visual \t

  # Unbind shift-tab 
  bind --erase --preset -M insert -k btab 
  bind --erase --preset -k btab 
  bind --erase --preset -M visual -k btab 

  # Unbind ctrl-l to clear screen
  bind --erase --preset -M insert \cl 
  bind --erase --preset \cl
  bind --erase --preset -M visual \cl

  # Bind tab to ctrl-l to open completion menu
  bind --preset -M insert \cl 'if commandline -P;  commandline -f execute; else; commandline -f complete; end'
  bind --preset \cl 'if commandline -P;  commandline -f execute; else; commandline -f complete && down-or-search; end'

  # Bind ctrl-h to cancel
  bind --preset \b cancel

  # Bind ctrl-j to ack like down
  bind --preset -M insert \n down-or-search
  bind --preset \n down-or-search
  bind --preset -M visual \n down-or-search

  # Bind ctrl-k to ack like up
  bind --preset -M insert \v up-or-search
  bind --preset \v up-or-search
  bind --preset -M visual \v up-or-search

  # Bind shift-tab to auto complete
  bind --preset -M insert -k btab forward-char
  bind --preset -k btab forward-char
  bind --preset -M visual -k btab forward-char

  # Bind / in normal mode to open history search
  bind --erase --preset / history-pager 
  bind -m insert / history-pager \;\ commandline\ -f\ repaint
  bind -m insert / commandline\ -f\ repaint \;\ commandline\ -f\ history-pager

end