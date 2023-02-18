local M = {}

function M.register(packer_use)
  packer_use {
    'windwp/nvim-autopairs',
    config = function()
      require('nvim-autopairs').setup {}
    end
  }
end

return M

