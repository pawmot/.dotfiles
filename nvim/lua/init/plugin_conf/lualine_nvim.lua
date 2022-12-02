lualine_nvim = {}

function lualine_nvim.register(packer_use)
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
        tabline = {
          lualine_a = {'buffers'},
          lualine_b = {},
          lualine_c = {},
          lualine_x = {},
          lualine_y = {},
          lualine_z = {'tabs'}
        },
        extensions = { 'fugitive' }
      }
    end
  }

end

return lualine_nvim

