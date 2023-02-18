local M = {}

function M.register(packer_use)
  packer_use {
    'mbbill/undotree'
  }

  local opts = { noremap = true }
  vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle, opts)
end

return M
