fzf = {}
local keymap = vim.api.nvim_set_keymap

function fzf.register(packer_use)
  packer_use { 'junegunn/fzf', run = function() vim.fn['fzf#install']() end }
  packer_use 'junegunn/fzf.vim'

  vim.g.fzf_history_dir = '~/.local/share/fzf-history'

  vim.g.fzf_action = {
    ['ctrl-t'] = 'tab split',
    ['ctrl-x'] = 'split',
    ['ctrl-v'] = 'vsplit'
  }

  keymap('', '<leader>f', ':Files<cr>', {})
  keymap('', '<leader>b', ':Buffers<cr>', {})
  keymap('n', '<leader>g', ':Rg<cr>', { noremap = true })
  keymap('n', '<leader>t', ':Tags<cr>', { noremap = true })
  keymap('n', '<leader>m', ':Marks<cr>', { noremap = true })

  vim.g.fzf_tags_command = 'ctags -R'
  vim.g.fzf_layout = {
    ['up'] = '~90%',
    ['window'] = {
      ['width'] = 0.8,
      ['height'] = 0.8,
      ['yoffset'] = 0.5,
      ['xoffset'] = 0.5,
      ['highlight'] = 'Todo',
      ['border'] = 'rounded'
    }
  }

  vim.env.FZF_DEFAULT_OPTS = '--layout=reverse --info=inline'
  vim.env.FZF_DEFAULT_COMMAND = 'fd --type=f'

  vim.g.fzf_colors = {
    ['fg'] = { 'fg', 'Normal' },
    ['bg'] = { 'bg', 'Normal' },
    ['hl'] = { 'fg', 'Comment' },
    ['fg+'] = { 'fg', 'CursorLine', 'CursorColumn', 'Normal' },
    ['bg+'] = { 'bg', 'CursorLine', 'CursorColumn' },
    ['hl+'] = { 'fg', 'Statement' },
    ['info'] = { 'fg', 'PreProc' },
    ['border'] = { 'fg', 'Ignore' },
    ['prompt'] = { 'fg', 'Conditional' },
    ['pointer'] = { 'fg', 'Exception' },
    ['marker'] = { 'fg', 'Keyword' },
    ['spinner'] = { 'fg', 'Label' },
    ['header'] = { 'fg', 'Comment' }
  }

  -- TODO consider the settings lifted from old .vimrc
  --[[

" Ripgrep advanced
function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

" Git grep
command! -bang -nargs=* GGrep
  \ call fzf#vim#grep(
  \   'git grep --line-number '.shellescape(<q-args>), 0,
  \   fzf#vim#with_preview({'dir': systemlist('git rev-parse --show-toplevel')[0]}), <bang>0)
--]]

end

return fzf

