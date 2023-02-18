local indent_blankline_nvim = {}

function indent_blankline_nvim.register(packer_use)
  packer_use {
    'lukas-reineke/indent-blankline.nvim',
    config = function()
      require("indent_blankline").setup {
        show_current_context = true,
        show_current_context_start = true,
        filetype_exclude = { 'dashboard' }
      }
    end
  }
end

return indent_blankline_nvim

