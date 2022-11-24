local telescope_nvim= {}
local keymap = vim.keymap.set

function telescope_nvim.register(packer_use)
  packer_use 'nvim-telescope/telescope.nvim'

  require('telescope').setup {
    defaults = {
      file_ignore_patterns = { '^.git/' }
    },
    pickers = {
      find_files = {
        find_command = { 'fd', '--strip-cwd-prefix', '--type', 'f' },
        hidden = true,
        layout_strategy = 'horizontal'
      }
    }
  }

  local tb = require('telescope.builtin')
  keymap('', '<leader>ff', tb.find_files, {})
  keymap('', '<leader>fb', tb.buffers, {})
  keymap('', '<leader>fg', tb.live_grep, {})
  keymap('', '<leader>fh', tb.help_tags, {})
  --keymap('n', '<leader>m', ':Marks<cr>', { noremap = true })

end

return telescope_nvim

