tokyonight = {}

function tokyonight.register(packer_use)
  packer_use {
    'folke/tokyonight.nvim'
  }

  require('tokyonight').setup({
    style = 'night'
  })

  vim.cmd [[
    colorscheme tokyonight
  ]]
end

return tokyonight

