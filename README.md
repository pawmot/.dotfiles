# .dotfiles

I maintain my dotfiles in this repo. Enjoy.

Leverages https://github.com/anishathalye/dotbot

TODO:
- [x] replace fzf with telescope
- [x] use rust-tools.nvim (integrate with mason.nvim)
- [x] configure rust-tools.nvim keymaps, look&feel etc.
- [x] configure nvim-dap (keymaps, additional plugins etc.)
- [ ] configure Rust debugging w/o external tools like codelldb (see rust-tools.nvim, https://alpha2phi.medium.com/neovim-for-beginners-debugging-using-dap-44626a767f57, https://alpha2phi.medium.com/neovim-for-beginners-packer-manager-plugin-e4d84d4c3451)
- [x] try easymotion or alternatives
- [x] indent-blankline.nvim
- [x] nvim-treesitter
- [x] treesitter incremental selection - try it!
- [x] consider using `requires` instead of `after`
- [x] add LSP servers like rust or typescript to preemptively install on a new system
- [ ] use impatient.nvim
- [x] use full-featured bufferline (e.g. bufferline.nvim)
- [x] use symbols-outline.nvim (or similar)
~- [ ] use glepnir/dashboard-nvim (configure)~
- [x] replace nvim-lsp-installer with mason.nvim
- [x] make LSP servers individual config more modular
- [ ] use tokyonight for tmux (consider the plugin functionality)
- [ ] configure autopairs (refer to README)
- [ ] configure endwise
- [x] nvim-treehopper
- [x] treesitter-context
- [ ] configure coq_nvim
- [ ] crates.nvim
- [ ] null-ls.nvim
- [ ] try copilot
- [ ] try catppucin theme for ALL
- [ ] show intro instead of dashboard (probably just wait for https://github.com/nvim-lualine/lualine.nvim/issues/773)
_REFACTOR_
- [ ] move plugin config outside of the `config` packer fns and configure plugins after installation (use pcall)
- [ ] use which-key.nvim for keymaps

