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
        layout_strategy = vim.o.lines > 40 and 'vertical' or 'horizontal',
      }
    },
    extensions = {
      file_browser = {
        hijack_netrw = true,
        layout_strategy = vim.o.lines > 40 and 'vertical' or 'horizontal'
      }
    }
  }

  telescope.load_extension('file_browser')

  local telescope_builtin = require('telescope.builtin')
  local wk = require('which-key')
  wk.register({
    f = {
      name = 'find',
      f = { telescope_builtin.find_files, 'find files' },
      e = { function() telescope.extensions.file_browser.file_browser({path = '%:p:h', select_buffer=true}) end, 'find buffers' },
      r = { telescope_builtin.oldfiles, 'show recent files' },
      b = { telescope_builtin.buffers, 'find buffers' },
      g = { telescope_builtin.live_grep, 'find grep' },
      h = { telescope_builtin.help_tags, 'find help tags' },
    },
    m = { ':marks<cr>', 'find marks' },
  }, { prefix = '<leader>' })
  --keymap('n', '<leader>ff', tb.find_files, {})
  --keymap('n', '<leader>fb', tb.buffers, {})
  --keymap('n', '<leader>fg', tb.live_grep, {})
  --keymap('n', '<leader>fh', tb.help_tags, {})
  --keymap('n', '<leader>m', ':Marks<cr>', { noremap = true })
end
