vim_airline = {}

function vim_airline.register(packer_use)
  packer_use 'vim-airline/vim-airline'

  vim.g.airline_powerline_fonts = 1
  vim.g['airline#extensions#tabline#enabled'] = 1
end

return vim_airline

