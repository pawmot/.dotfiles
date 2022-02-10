lualine_nvim = {}

function lualine_nvim.register(packer_use)
  packer_use 'nvim-lualine/lualine.nvim'
  packer_use 'arkav/lualine-lsp-progress'

  require('lualine').setup {
    options = {
      theme = 'dracula'
    },
    sections = {
      lualine_c = {'filename', 'lsp_progress'}
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

return lualine_nvim

