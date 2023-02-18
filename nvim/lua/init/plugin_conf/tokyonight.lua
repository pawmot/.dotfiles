local M = {}

function M.register(packer_use)
  packer_use {
    'folke/tokyonight.nvim',
    config = function()
      require('tokyonight').setup({
        style = 'night'
      })

      vim.cmd [[
        colorscheme tokyonight
      ]]
    end
  }
end

return M

