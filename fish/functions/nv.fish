function nv
  nvim --listen $(mktemp --directory /tmp/nvimXXXXXX)/0 $argv
end
