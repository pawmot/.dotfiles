nvim_lspconfig = {}

function nvim_lspconfig.register(packer_use)
  packer_use 'neovim/nvim-lspconfig'
  -- Mappings.
  -- See `:help vim.diagnostic.*` for documentation on any of the below functions
  local opts = { noremap=true, silent=true }
  vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, opts)
  vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
  vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
  vim.keymap.set('n', '<leader>D', vim.diagnostic.setloclist, opts)

end

return nvim_lspconfig

