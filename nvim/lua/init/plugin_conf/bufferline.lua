local M = {}

function M.register(packer_use)
  packer_use {
    'akinsho/bufferline.nvim',
    tag='v3.*',
    config = function()
      vim.opt.termguicolors = true
      require('bufferline').setup{
        options = {
          close_command = nil,
          right_mouse_command = nil,
          left_mouse_command = nil,
          diagnostics = 'nvim_lsp',
          show_buffer_close_icons = false,
          show_close_icon = false,
        }
      }
    end
  }
end

return M

