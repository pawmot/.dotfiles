# .dotfiles

I maintain my dotfiles in this repo. Enjoy.

Leverages https://github.com/anishathalye/dotbot

TODO:
- [x] replace fzf with telescope
- [x] use rust-tools.nvim (integrate with mason.nvim)
- [x] configure rust-tools.nvim keymaps, look&feel etc.
- [x] configure nvim-dap (keymaps, additional plugins etc.)
- [x] configure Rust debugging w/o external tools like codelldb (see rust-tools.nvim, https://alpha2phi.medium.com/neovim-for-beginners-debugging-using-dap-44626a767f57, https://alpha2phi.medium.com/neovim-for-beginners-packer-manager-plugin-e4d84d4c3451)
- [x] configure automatic DAP adapters installation
- [x] look for universal Mason installator
- [x] try easymotion or alternatives
- [x] indent-blankline.nvim
- [x] nvim-treesitter
- [x] treesitter incremental selection - try it!
- [x] consider using `requires` instead of `after`
- [x] add LSP servers like rust or typescript to preemptively install on a new system
- [x] use full-featured bufferline (e.g. bufferline.nvim)
- [x] use symbols-outline.nvim (or similar)
- [x] replace nvim-lsp-installer with mason.nvim
- [x] make LSP servers individual config more modular
- [ ] configure autopairs (refer to README)
- [ ] configure endwise
- [x] nvim-treehopper
- [x] treesitter-context
- [ ] configure coq_nvim
- [ ] crates.nvim
- [ ] null-ls.nvim
- [x] try copilot
- [x] use tokyonight for tmux (consider the plugin functionality)
- [x] create a switch to toggle dark/light mode (kitty, tmux, neovim)
- [ ] show intro instead of dashboard (probably just wait for https://github.com/nvim-lualine/lualine.nvim/issues/773)
- [ ] make lsp progress nice
- [ ] snippeting engine (luasnip?)
- [ ] toggle extended lsp diagnostics (???)
- [ ] decide on lspsaga or other plugins
- [ ] consider folding
- [ ] consider marks
- [ ] telescope.menufacture
- [ ] telescope file browser
- [x] telescope grep/fuzzy find in current buffer. Look at telescope-fzf-native
- [x] make the tmux status line nice after moving everything to tokyonight
- [ ] make the LSP progress notifications nicer
- [ ] telescope advanced git search

REFACTOR:
- [x] use lazy.nvim instead of packer
- [ ] use which-key.nvim for keymaps
- [ ] move plugin config INTO `config` lazy.nvim functions - it works differently from packer and looks like the proper place to configure plugins

WON'T DO (for now?):
- [ ] use impatient.nvim
- [ ] use glepnir/dashboard-nvim (configure)
- [ ] move plugin config outside of the `config` packer functions and configure plugins after installation (use pcall)

