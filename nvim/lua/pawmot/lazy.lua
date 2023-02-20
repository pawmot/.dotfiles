local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
    lazy = false,
    config = function()
      vim.cmd.colorscheme 'catppuccin-mocha'
    end
  },
  'nvim-lua/plenary.nvim',
  'nvim-lua/popup.nvim',
  'stevearc/dressing.nvim',
  'kyazdani42/nvim-web-devicons',
  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      'nvim-telescope/telescope-file-browser.nvim'
    }
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'arkav/lualine-lsp-progress' }
  },
  {
    'akinsho/bufferline.nvim',
    version = '3.*'
  },
  'airblade/vim-rooter',
  'editorconfig/editorconfig-vim',
  'tpope/vim-fugitive',
  'airblade/vim-gitgutter',
  'lukas-reineke/indent-blankline.nvim',
  {
    'phaazon/hop.nvim',
    version = 'v2'
  },
  {
    'williamboman/mason.nvim',
    dependencies = {
      'WhoIsSethDaniel/mason-tool-installer.nvim',
      'williamboman/mason-lspconfig.nvim',
      'neovim/nvim-lspconfig',
      'ray-x/lsp_signature.nvim',
      'simrat39/rust-tools.nvim',
      'ray-x/go.nvim',
      'https://git.sr.ht/~whynothugo/lsp_lines.nvim',
      'folke/trouble.nvim',
      'simrat39/symbols-outline.nvim',
      'windwp/nvim-autopairs',
      {
        'glepnir/lspsaga.nvim',
        event = 'Bufread'
      },
      {
        'saecki/crates.nvim',
        event = 'Bufread Cargo.toml'
      },
      {
        'ms-jpq/coq_nvim',
        branch = 'coq',
        dependencies = {
          { 'ms-jpq/coq.artifacts',  branch = 'artifacts' },
          { 'ms-jpq/coq.thirdparty', branch = '3p' }
        },
        build = ':COQdeps'
      }
    }
  },
  {
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'p00f/nvim-ts-rainbow',
      'windwp/nvim-ts-autotag',
      'JoosepAlviste/nvim-ts-context-commentstring',
      'nvim-treesitter/nvim-treesitter-context',
      'nvim-treesitter/playground',
      'mfussenegger/nvim-treehopper'
    },
    build = function()
      local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
      ts_update()
    end
  },
  {
    'mfussenegger/nvim-dap',
    dependencies = {
      'theHamsta/nvim-dap-virtual-text',
      'rcarriga/nvim-dap-ui'
    }
  },
  {
    'ellisonleao/glow.nvim',
    config = function()
      require('glow').setup()
    end,
  },
  {
    'mbbill/undotree',
    config = function()
      local opts = { noremap = true }
      vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle, opts)
    end
  },
  'github/copilot.vim',
  'David-Kunz/jester',
  'folke/which-key.nvim'
})
