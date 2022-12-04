local M = {}

function M.register(packer_use)
  packer_use {
    'simrat39/symbols-outline.nvim',
    config = function()
      local symbols_outline = require('symbols-outline')
      symbols_outline.setup()
      local opts = { noremap=true, silent=true }
      vim.keymap.set('n', '<space>S', symbols_outline.toggle_outline, opts)
    end
  }
end

return M

