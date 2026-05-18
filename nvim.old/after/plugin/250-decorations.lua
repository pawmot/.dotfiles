local ok, lualine = pcall(require, 'lualine');

if not ok then
  print('could not load lualine')
else
  lualine.setup {
    options = {
      --theme = 'nightfox',
      section_separators = { left = '', right = ''},
      component_separators = ''
    },
    sections = {
      lualine_a = {'mode'},
      lualine_b = {{'filename', path = 1}, {'filetype', icon_only = true}, 'diagnostics'},
      lualine_c = {},
      lualine_x = {},
      lualine_y = {{'branch', fmt = function(str) return str and string.len(str) < 25 and str or str:sub(1, 20) .. '[...]' end }},
      lualine_z = {'location'}
    },
    tabline = {},
    extensions = { 'fugitive' },
  }
end

---@diagnostic disable-next-line: redefined-local
local ok, bufferline = pcall(require, 'bufferline')

if not ok then
  print('could not load bufferline')
else
  vim.opt.termguicolors = true
  bufferline.setup{
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

-- ---@diagnostic disable-next-line: redefined-local
-- local ok, indent_blankline = pcall(require, 'ibl')
--
-- if not ok then
--   print('could not load indent_blankline')
-- else
--   indent_blankline.setup {
--     show_current_context = true,
--     show_current_context_start = true,
--     filetype_exclude = { 'dashboard' }
--   }
-- end

---@diagnostic disable-next-line: redefined-local
local ok, todo_comments = pcall(require, 'todo-comments')

if not ok then
  print('could not load todo-comments')
else
  todo_comments.setup {}
end

local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<leader>hh', vim.cmd.GitGutterLineHighlightsToggle, opts)

