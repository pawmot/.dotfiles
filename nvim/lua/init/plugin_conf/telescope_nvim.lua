local telescope_nvim= {}
local keymap = vim.api.nvim_set_keymap

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

  keymap('', '<leader>ff', '<cmd>lua require(\'telescope.builtin\').find_files()<cr>', {})
  keymap('', '<leader>fb', '<cmd>lua require(\'telescope.builtin\').buffers()<cr>', {})
  keymap('', '<leader>fg', '<cmd>lua require(\'telescope.builtin\').live_grep()<cr>', {})
  keymap('', '<leader>fh', '<cmd>lua require(\'telescope.builtin\').help_tags()<cr>', {})
  --keymap('n', '<leader>m', ':Marks<cr>', { noremap = true })

end

return telescope_nvim

