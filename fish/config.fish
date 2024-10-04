if status is-interactive
  #if test -z "$DISPLAY" -a "$XDG_VTNR" = 1
  #  exec startx
  #end
end

starship init fish | source
atuin init fish | source
bind k _atuin_bind_up
#nvm_load > /dev/stderr
nvm use default
set -x PATH "$HOME/.cargo/bin" $PATH
set -x PATH "$HOME/.local/bin" $PATH
set -x PATH "$HOME/go/bin" $PATH

# Emulates vim's cursor shape behavior
# Set the normal and visual mode cursors to a block
set fish_cursor_default block
# Set the insert mode cursor to a line
set fish_cursor_insert line
# Set the replace mode cursor to an underscore
set fish_cursor_replace_one underscore
# The following variable can be used to configure cursor shape in
# visual mode, but due to fish_cursor_default, is redundant here
set fish_cursor_visual block
