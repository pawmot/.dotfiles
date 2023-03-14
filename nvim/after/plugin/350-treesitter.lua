local ok, ts_configs = pcall(require, 'nvim-treesitter.configs')

if not ok then
  print('could not load treesitter')
else
  ts_configs.setup({
    ensure_installed = { 'rust', 'typescript', 'lua' },
    sync_install = true,
    auto_install = true,
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false
    },
    indent = {
      enable = true
    },
    context_commentstring = {
      enable = true
    },
    rainbow = {
      enable = true
    },
    endwise = {
      enable = true
    },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = '<Leader>s',
        scope_incremental = 's',
        node_incremental = 'n',
        node_decremental = 'N',
      }
    },
    playground = {
      enable = true,
      disable = {},
      updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
      persist_queries = false, -- Whether the query persists across vim sessions
    }
  })

  local function ContextSetup(topline)
    require('treesitter-context').setup({
      enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
      throttle = true, -- Throttles plugin updates (may improve performance)
      max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit. 
      mode = topline and 'topline' or 'cursor',
      patterns = { -- Match patterns for TS nodes. These get wrapped to match at word boundaries.
        -- For all filetypes
        -- Note that setting an entry here replaces all other patterns for this entry.
        -- By setting the 'default' entry below, you can control which nodes you want to
        -- appear in the context window.
        default = {
          'class',
          'function',
          'method',
          'for',
          'while',
          'if',
          'else',
          'else_clause',
          'switch',
          'case',
          'interface',
          'struct',
          'enum',
        },

        rust = {
          'impl_item',
          'match',
        },

        typescript = {
          'export_statement'
        },
      },
    })
  end

  local opts = { noremap = true, silent = true }
  local topline = true
  ContextSetup(topline)
  vim.keymap.set('n', '<leader>tc', function()
    topline = not topline
    ContextSetup(topline)
  end, opts)
  -- TODO: temporary workaround, remove when https://github.com/p00f/nvim-ts-rainbow/issues/112 is fixed
  vim.keymap.set('n', '<leader>tr', ':TSDisable rainbow<cr>:TSEnable rainbow<cr>', opts)

  local th = require('tsht')
  --find out how to set it up as the author suggests but in lua
  vim.keymap.set('o', 'm', ':<C-U>lua require("tsht").nodes()<CR>', { silent = true })
  vim.keymap.set('x', 'm', ':lua require("tsht").nodes()<CR>', { noremap=true, silent=true });
end
