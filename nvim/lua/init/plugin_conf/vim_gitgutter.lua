vim_gitgutter = {}

function vim_gitgutter.register(packer_use)
  packer_use 'airblade/vim-gitgutter'

  vim.g.gitgutter_sign_added = '✚'
  vim.g.gitgutter_sign_modified = '∼'
  vim.g.gitgutter_sign_removed = '⊗'
  vim.g.gitgutter_sign_removed_first_line = '△'
  vim.g.gitgutter_sign_modified_removed = '-'
  vim.g.airline_powerline_fonts = 1
end

return vim_gitgutter


