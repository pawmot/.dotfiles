telescope_nvim= {}

function telescope_nvim.register(packer_use)
  packer_use { 
    'nvim-telescope/telescope.nvim',
    config = function()
      require('telescope').setup {
        defaults = {
          file_ignore_patterns = { '^.git/' }
        },
        pickers = {
          find_files = {
            find_command = { 'fd', '--strip-cwd-prefix', '--type', 'f' },
            hidden = true,
            layout_strategy = 'vertical'
          }
        }
      }
    
      local keymap = vim.keymap.set
      local tb = require('telescope.builtin')
      keymap('n', '<leader>ff', tb.find_files, {})
      keymap('n', '<leader>fb', tb.buffers, {})
      keymap('n', '<leader>fg', tb.live_grep, {})
      keymap('n', '<leader>fh', tb.help_tags, {})
      keymap('n', '<leader>m', ':Marks<cr>', { noremap = true })
    end
  }
end

return telescope_nvim

