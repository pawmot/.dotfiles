local nvim_treesitter = {}

function nvim_treesitter.register(packer_use)
  packer_use {
    'nvim-treesitter/nvim-treesitter',
    requires = {
      {
        'p00f/nvim-ts-rainbow'
      },
      {
        'windwp/nvim-ts-autotag'
      },
      {
        'JoosepAlviste/nvim-ts-context-commentstring'
      },
      {
        'nvim-treesitter/nvim-treesitter-context'
      }
    },
    config = function()
      require('nvim-treesitter.configs').setup({
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
        autopairs = {
          enable = true
        },
        context_commentstring = {
          enable = true
        },
        rainbow = {
          enable = true,
          extended_mode = true,
          max_file_lines = nil,
        },
        autotag = {
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
        }
      })

      local function ContextSetup(topline)
        require("treesitter-context").setup({
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
              'switch',
              'case',
              'interface',
              'struct',
              'enum',
            },

            rust = {
              "impl_item",
            },

            typescript = {
              "export_statement"
            },
          },
        })
      end

      local opts = { noremap = true, silent = true }
      local topline = false
      ContextSetup(topline)
      vim.keymap.set('n', '<space>cf', function()
        topline = not topline
        ContextSetup(topline)
      end, opts)
    end,
    run = function()
      local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
      ts_update()
    end
  }
end

return nvim_treesitter
