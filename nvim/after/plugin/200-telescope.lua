local ok, telescope = pcall(require, 'telescope')

if not ok then
  print('could not load telescope')
else
  telescope.setup {
    defaults = {
      file_ignore_patterns = { '^.git/', 'node_modules/', '_build/', '.elixir_ls/' }
    },
    pickers = {
      find_files = {
        find_command = { 'fd', '--strip-cwd-prefix', '--type', 'f' },
        hidden = true,
        layout_strategy = vim.o.lines > 40 and 'vertical' or 'horizontal',
      },
      lsp_references = {
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

  telescope.load_extension('fzf')
  telescope.load_extension('file_browser')

  local telescope_builtin = require('telescope.builtin')
  local telescope_themes = require('telescope.themes')
  local wk = require('which-key')
  wk.add({
        { '<leader>f', group = 'find' },
        { '<leader>ff', telescope_builtin.find_files, desc = 'find files' },
        { '<leader>fb', telescope_builtin.buffers, desc = 'find buffers' },
        { '<leader>fg', telescope_builtin.live_grep, desc = 'grep files\' content' },
        { '<leader>fh', telescope_builtin.help_tags, desc = 'find help tags' },
        { '<leader>fm', ':marks<cr>', desc = 'find marks' },
        { '<leader>fc', function()
              telescope_builtin.current_buffer_fuzzy_find(telescope_themes.get_dropdown({ height = 10, previewer = false }))
            end,
            desc = 'find in current buffer' },
        { '<leader>fr', telescope_builtin.oldfiles, desc = 'show recent files' },
        { '<leader>fe', function() telescope.extensions.file_browser.file_browser({ path = '%:p:h', select_buffer = true }) end, desc = 'browser files' },
        { '<leader>g', group = 'lsp' },
        { '<leader>gR', telescope_builtin.lsp_references, desc = 'show LSP references' },
    })
  --keymap('n', '<leader>ff', tb.find_files, {})
  --keymap('n', '<leader>fb', tb.buffers, {})
  --keymap('n', '<leader>fg', tb.live_grep, {})
  --keymap('n', '<leader>fh', tb.help_tags, {})
  --keymap('n', '<leader>m', ':Marks<cr>', { noremap = true })
end
