if status is-interactive
  #if test -z "$DISPLAY" -a "$XDG_VTNR" = 1
  #  exec startx
  #end
end

starship init fish | source
#nvm_load > /dev/stderr

