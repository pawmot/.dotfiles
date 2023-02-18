local M = {}

function M.register(packer_use)
  packer_use {
    'mfussenegger/nvim-treehopper',
    config = function()
      local th = require('tsht')
      --find out how to set it up as the author suggests but in lua
      vim.keymap.set('o', 'm', ':<C-U>lua require("tsht").nodes()<CR>', { silent = true })
      vim.keymap.set('x', 'm', ':lua require("tsht").nodes()<CR>', { noremap=true, silent=true });
    end
  }
end

return M

