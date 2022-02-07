nvim_lspconfig = {}

function nvim_lspconfig.register(packer_use)
  packer_use 'neovim/nvim-lspconfig'
  -- Mappings.
  -- See `:help vim.diagnostic.*` for documentation on any of the below functions
  local opts = { noremap=true, silent=true }
  vim.api.nvim_set_keymap('n', '<leader>d', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
  vim.api.nvim_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
  vim.api.nvim_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
  vim.api.nvim_set_keymap('n', '<leader>D', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)

end

return nvim_lspconfig

