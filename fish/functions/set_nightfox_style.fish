function set_nightfox_style -a style
    set -q style[1]; or set -f style "carbon"
    set -f sanitizedStyle (echo $style | grep -E '^(night|day|dawn|dusk|nord|tera|carbon)$')
    if test -z $sanitizedStyle
        echo "Supported styles: night, day, dawn, dusk, nord, tera, carbon"
        return 1
    end
    echo "Setting $style"
    echo "Setting kitty..."
    set -f stylefox (echo "$style"fox)
    sed -E -i.bak "s/include themes\/[A-Za-z]*\/[A-Za-z_]*.conf/include themes\/nightfox\/$stylefox.conf/" $HOME/.dotfiles/kitty/kitty.conf && rm $HOME/.dotfiles/kitty/kitty.conf.bak
    echo "Setting tmux..."
    sed -E -i.bak "s/set -g @plugin 'pawmot\/[A-Za-z]*-tmux'/set -g @plugin 'pawmot\/nightfox-tmux'/" $HOME/.dotfiles/tmux.conf && rm $HOME/.dotfiles/tmux.conf.bak
    sed -E -i.bak "s/set -g @[A-Za-z]*_style '[A-Za-z]*'/set -g @nightfox_style '$stylefox'/" $HOME/.dotfiles/tmux.conf && rm $HOME/.dotfiles/tmux.conf.bak
    # FIXME: The following does not work very well, it seems that the colorscheme needs to be set in lazy.lua
    echo "Setting neovim..."
    sed -E -i.bak "s/vim.cmd.colorscheme '[A-Za-z\-]*'/vim.cmd.colorscheme '$stylefox'/" $HOME/.dotfiles/nvim/after/plugin/050-colorscheme.lua && rm $HOME/.dotfiles/nvim/after/plugin/050-colorscheme.lua.bak
    echo "Reloading kitty..."
    kill -SIGUSR1 $(pgrep -f kitty)
    echo "Reloading tmux..."
    tmux source-file $HOME/.dotfiles/tmux.conf
    echo "Changing colorscheme in all running neovim instances..."
    type -q nvim-ctrl; or cargo install --git https://github.com/pawmot/nvim-ctrl
    nvim-ctrl "colorscheme $stylefox"
end


