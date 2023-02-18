local M = {}

function M.register(packer_use)
  packer_use {
    'akinsho/toggleterm.nvim',
    tag = '*',
    config = function()
      require('toggleterm').setup {
        direction = 'float',
        float_opts = {
          border = 'single'
        }
      }

      local opts = { noremap = true, silent = true }
      vim.keymap.set('n', '<C-\\>', function() vim.cmd('ToggleTerm') end, opts)
    end
  }
end

return M
