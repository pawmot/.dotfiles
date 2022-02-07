local fn = vim.fn
-- Install packer if not found
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer... close and reopen Neovim"
  vim.cmd [[packadd packer.nvim]]
end

-- Setup a keymap to PackerSync
vim.api.nvim_set_keymap('n', '<leader>ps', ':PackerSync<cr>', {})

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

return packer.startup(function()
local keymap = vim.api.nvim_set_keymap
  require('init/plugin_conf/packer_nvim').register(packer.use)
  require('init/plugin_conf/popup_nvim').register(packer.use)
  require('init/plugin_conf/dracula').register(packer.use)
  require('init/plugin_conf/fzf').register(packer.use)
  require('init/plugin_conf/vim_rooter').register(packer.use)
  require('init/plugin_conf/editorconfig_vim').register(packer.use)
  require('init/plugin_conf/vim_airline').register(packer.use)
  require('init/plugin_conf/vim_devicons').register(packer.use)
  require('init/plugin_conf/fugitive_vim').register(packer.use)
  require('init/plugin_conf/vim_gitgutter').register(packer.use)
  require('init/plugin_conf/nvim_lspconfig').register(packer.use)
  require('init/plugin_conf/coq_nvim').register(packer.use)
  require('init/plugin_conf/nvim_lsp_installer').register(packer.use)
  require('init/plugin_conf/rust_vim').register(packer.use)

  vim.cmd [[ syntax enable ]]
  vim.cmd [[ filetype plugin indent on ]]

  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
