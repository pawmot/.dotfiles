function set_tokyonight_style -a style
    set -q style[1]; or set -f style "night"
    set -f sanitizedStyle (echo $style | grep -E '^(day|storm|moon|night)$')
    if test -z $sanitizedStyle
        echo "Supported styles: day, moon, storm, night"
        return 1
    end
    echo "Setting tokyonight-$style"
    echo "Setting kitty..."
    sed -E -i.bak "s/include themes\/[A-Za-z]*\/[A-Za-z_]*.conf/include themes\/tokyonight\/tokyonight_$style.conf/" $HOME/.dotfiles/kitty/kitty.conf && rm $HOME/.dotfiles/kitty/kitty.conf.bak
    echo "Setting tmux..."
    sed -E -i.bak "s/set -g @plugin 'pawmot\/[A-Za-z]*-tmux'/set -g @plugin 'pawmot\/tokyonight-tmux'/" $HOME/.dotfiles/tmux.conf && rm $HOME/.dotfiles/tmux.conf.bak
    sed -E -i.bak "s/set -g @[A-Za-z]*_style '[A-Za-z]*'/set -g @tokyonight_style '$style'/" $HOME/.dotfiles/tmux.conf && rm $HOME/.dotfiles/tmux.conf.bak
    # FIXME: The following does not work very well, it seems that the colorscheme needs to be set in lazy.lua
    echo "Setting neovim..."
    sed -E -i.bak "s/vim.cmd.colorscheme '[A-Za-z\-]*'/vim.cmd.colorscheme 'tokyonight-$style'/" $HOME/.dotfiles/nvim/after/plugin/050-colorscheme.lua && rm $HOME/.dotfiles/nvim/after/plugin/050-colorscheme.lua.bak
    echo "Reloading kitty..."
    kill -SIGUSR1 $(pgrep -f kitty)
    echo "Reloading tmux..."
    tmux source-file $HOME/.dotfiles/tmux.conf
    echo "Changing colorscheme in all running neovim instances..."
    type -q nvim-ctrl; or cargo install --git https://github.com/pawmot/nvim-ctrl
    nvim-ctrl "colorscheme tokyonight-$style"
end

