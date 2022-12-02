local nvim_treesitter = {}

function nvim_treesitter.register(packer_use)
  packer_use {
    'nvim-treesitter/nvim-treesitter',
    requires = {
      {
        'p00f/nvim-ts-rainbow',
        enable = false
      },
      {
        'windwp/nvim-ts-autotag'
      },
      {
        'JoosepAlviste/nvim-ts-context-commentstring'
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
        }
      })
    end,
    run = function()
      local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
      ts_update()
    end
  }
end

return nvim_treesitter

