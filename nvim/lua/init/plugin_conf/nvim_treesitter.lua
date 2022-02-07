local nvim_treesitter = {}

function nvim_treesitter.register(packer_use)
  packer_use {
    'nvim-treesitter/nvim-treesitter',
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
    }
  }
end

return nvim_treesitter

