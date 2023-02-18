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
          --lualine_c = {{'filename', path = 1}, 'lsp_progress'}
          lualine_b = {{'filename', path = 1}, {'filetype', icon_only = true}, 'diagnostics'},
          lualine_c = {'lsp_progress'},
          lualine_x = {},
          lualine_y = {'encoding'},
          lualine_z = {'progress', 'location'}
        },
        tabline = {},
        extensions = { 'fugitive' },
      }
    end
  }

end

return M

