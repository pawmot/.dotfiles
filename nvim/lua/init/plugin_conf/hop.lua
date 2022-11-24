hop = {}

function hop.register(packer_use)
  packer_use {
    'phaazon/hop.nvim',
    branch = 'v2',
    config = function()
      require'hop'.setup {
        keys = 'etovxqpdygfblzhckisuran',
        jump_on_sole_occurence = false
      }
    end
  }

  local h = require('hop')
  local dir = require('hop.hint').HintDirection
  vim.keymap.set('', '<leader><leader>f', function()
    h.hint_char1({ direction = dir.AFTER_CURSOR, current_line_only = false })
  end, { remap = true })
  vim.keymap.set('', '<leader><leader>F', function()
    h.hint_char1({ direction = dir.BEFORE_CURSOR, current_line_only = false })
  end, { remap = true })
  vim.keymap.set('', '<leader><leader>/', function()
    h.hint_patterns({ direction = dir.AFTER_CURSOR, current_line_only = false })
  end, { remap = true })
  vim.keymap.set('', '<leader><leader>?', function()
    h.hint_patterns({ direction = dir.BEFORE_CURSOR, current_line_only = false })
  end, { remap = true })
  vim.keymap.set('', '<leader><leader>w', function()
    h.hint_words({ direction = dir.AFTER_CURSOR, current_line_only = false })
  end, { remap = true })
  vim.keymap.set('', '<leader><leader>W', function()
    h.hint_words({ direction = dir.BEFORE_CURSOR, current_line_only = false })
  end, { remap = true })

end

return hop

