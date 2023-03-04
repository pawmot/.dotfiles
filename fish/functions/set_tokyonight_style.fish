function set_tokyonight_style -a style
  set -q style[1]; or set -f style "night"
  set -f sanitizedStyle (echo $style | grep -E '^(day|storm|moon|night)$')
  if test -z $sanitizedStyle
    echo "Supported styles: day, moon, storm, night"
    return 1
  end
  echo "Setting tokyonight-$style"
  echo "Setting kitty..."
  sed -E -i'' "s/include tokyonight_(day|night|storm|moon).conf/include tokyonight_$style.conf/" $HOME/.dotfiles/kitty/kitty.conf
  echo "Setting tmux..."
  sed -E -i'' "s/set -g @tokyonight_style '(day|night|storm|moon)'/set -g @tokyonight_style '$style'/" $HOME/.dotfiles/tmux.conf
  echo "Setting neovim..."
  sed -E -i'' "s/vim.cmd.colorscheme 'tokyonight-(day|night|storm|moon)'/vim.cmd.colorscheme 'tokyonight-$style'/" $HOME/.dotfiles/nvim/lua/pawmot/lazy.lua
  echo "Reloading kitty..."
  kill -SIGUSR1 $(pgrep -f kitty)
  echo "Reloading tmux..."
  tmux source-file $HOME/.dotfiles/tmux.conf
  echo "Changing colorscheme in all running neovim instances..."
  nvim-ctrl "colorscheme tokyonight-$style"
end

