dracula = {}

function dracula.register(packer_use)
  packer_use 'dracula/vim'

  vim.cmd [[
    let g:dracula_colorterm = 0
    colorscheme dracula
  ]]
end

return dracula

