local M = {}

function M.register(packer_use)
  packer_use {
    'nvim-lualine/lualine.nvim',
    requires = {
      {
        'arkav/lualine-lsp-progress'
      }
    },
    config = function()
      require('lualine').setup {
        options = {
          theme = 'tokyonight'
        },
        sections = {
          lualine_c = {{'filename', path = 1}, 'lsp_progress'}
        },
        tabline = {},
        extensions = { 'fugitive' }
      }
    end
  }

end

return M

