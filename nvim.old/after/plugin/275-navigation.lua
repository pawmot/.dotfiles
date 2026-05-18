local ok, hop = pcall(require, 'hop')

if not ok then
  print('could not load hop')  
else
  hop.setup {
    keys = 'etovxqpdygfblzhckisuran',
    jump_on_sole_occurence = false
  }

  local dir = require('hop.hint').HintDirection
  vim.keymap.set('', '<leader><leader>f', function()
    hop.hint_char1({ direction = dir.AFTER_CURSOR, current_line_only = false })
  end, { remap = true })
  vim.keymap.set('', '<leader><leader>F', function()
    hop.hint_char1({ direction = dir.BEFORE_CURSOR, current_line_only = false })
  end, { remap = true })
  vim.keymap.set('', '<leader><leader>d', function()
    hop.hint_char2({ direction = dir.AFTER_CURSOR, current_line_only = false })
  end, { remap = true })
  vim.keymap.set('', '<leader><leader>D', function()
    hop.hint_char2({ direction = dir.BEFORE_CURSOR, current_line_only = false })
  end, { remap = true })
  vim.keymap.set('', '<leader><leader>/', function()
    hop.hint_patterns({ direction = dir.AFTER_CURSOR, current_line_only = false })
  end, { remap = true })
  vim.keymap.set('', '<leader><leader>?', function()
    hop.hint_patterns({ direction = dir.BEFORE_CURSOR, current_line_only = false })
  end, { remap = true })
  vim.keymap.set('', '<leader><leader>w', function()
    hop.hint_words({ direction = dir.AFTER_CURSOR, current_line_only = false })
  end, { remap = true })
  vim.keymap.set('', '<leader><leader>W', function()
    hop.hint_words({ direction = dir.BEFORE_CURSOR, current_line_only = false })
  end, { remap = true })
end
