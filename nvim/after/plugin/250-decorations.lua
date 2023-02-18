local ok, lualine = pcall(require, 'lualine');

if not ok then
  print('could not load lualine')
else
  lualine.setup {
    options = {
      theme = 'catppuccin'
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

local ok, bufferline = pcall(require, 'bufferline')
local cat_ok, catppuccin_bufferline = pcall(require, 'catppuccin.groups.integrations.bufferline')

if not ok then
  print('could not load bufferline')
else
  vim.opt.termguicolors = true
  bufferline.setup{
    highlights = cat_ok and catppuccin_bufferline.get(),
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

local ok, indent_blankline = pcall(require, 'indent_blankline')

if not ok then
  print('could not load indent_blankline')
else
  indent_blankline.setup {
    show_current_context = true,
    show_current_context_start = true,
    filetype_exclude = { 'dashboard' }
  }
end

-- TODO review the signs
vim.g.gitgutter_sign_added = '✚'
vim.g.gitgutter_sign_modified = '∼'
vim.g.gitgutter_sign_removed = '○'
vim.g.gitgutter_sign_removed_first_line = '△'
vim.g.gitgutter_sign_modified_removed = '-'
vim.g.airline_powerline_fonts = 1

