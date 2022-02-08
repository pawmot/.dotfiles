local nvim_treesitter = {}

function nvim_treesitter.register(packer_use)
  packer_use {
    'nvim-treesitter/nvim-treesitter',
    requires = {
      {
        'p00f/nvim-ts-rainbow',
        after = 'nvim-treesitter',
        enable = false
      },
      {
        'windwp/nvim-ts-autotag',
        after = 'nvim-treesitter'
      },
      {
        'JoosepAlviste/nvim-ts-context-commentstring',
        after = 'nvim-treesitter'
      }
    },

    run = ':TSUpdate'
  }

  require('nvim-treesitter.configs').setup {
    ensure_installed = { 'rust', 'typescript', 'lua' },
    sync_install = false,
    highlight = {
      enable = true,
      additiona_vim_regex_highlighting = false
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
      enable = false,
      extended_mode = false,
      max_file_lines = nil,
    },
    autotag = {
      enable = true
    }
  }
end

return nvim_treesitter

