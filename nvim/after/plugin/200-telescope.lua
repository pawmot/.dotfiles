local ok, telescope = pcall(require, 'telescope')

if not ok then
  print('could not load telescope')
else
  telescope.setup {
    defaults = {
      file_ignore_patterns = { '^.git/' }
    },
    pickers = {
      find_files = {
        find_command = { 'fd', '--strip-cwd-prefix', '--type', 'f' },
        hidden = true,
        layout_strategy = vim.o.lines > 40 and 'vertical' or 'horizontal'
      }
    }
  }

  local keymap = vim.keymap.set
  local tb = require('telescope.builtin')
  -- TODO keymaps
  keymap('n', '<leader>ff', tb.find_files, {})
  keymap('n', '<leader>fb', tb.buffers, {})
  keymap('n', '<leader>fg', tb.live_grep, {})
  keymap('n', '<leader>fh', tb.help_tags, {})
  keymap('n', '<leader>m', ':Marks<cr>', { noremap = true })
end
