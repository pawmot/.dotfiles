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

-- TODO: review the signs
-- TODO: the signs don't work when in after - find out why
vim.g.gitgutter_sign_added = '✚'
vim.g.gitgutter_sign_modified = '∼'
vim.g.gitgutter_sign_removed = '-'
vim.g.gitgutter_sign_removed_first_line = '⊼'
vim.g.gitgutter_sign_modified_removed = '≃'
vim.g.airline_powerline_fonts = 1

require('lazy').setup({
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    enabled = false,
    priority = 1000,
    lazy = false,
    config = function()
      vim.cmd.colorscheme 'catppuccin-mocha'
    end
  },
  {
    'folke/tokyonight.nvim',
    priority = 1000,
    lazy = false,
    config = function()
      vim.cmd.colorscheme 'tokyonight-night'
    end
  },
  'nvim-lua/plenary.nvim',
  'nvim-lua/popup.nvim',
  'stevearc/dressing.nvim',
  'kyazdani42/nvim-web-devicons',
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'make'
  },
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
    'windwp/nvim-autopairs',
    config = function()
      local npairs = require('nvim-autopairs')
      npairs.setup()
      local opts = { noremap = true, expr = true }
      vim.keymap.set('i', '<cr>', function()
        print('cr')
        if vim.fn.pumvisible() ~= 0 then
          if vim.fn.complete_info({ 'selected' }).selected ~= -1 then
            return npairs.esc('<c-y>')
          else
            return npairs.esc('<c-e>') .. npairs.autopairs_cr()
          end
        else
          return npairs.autopairs_cr()
        end
      end, opts)
      vim.keymap.set('i', '<bs>', function()
        if vim.fn.pumvisible() ~= 0 and vim.fn.complete_info({ 'mode' }).mode == 'eval' then
          return npairs.esc('<c-e>') .. npairs.autopairs_bs()
        else
          return npairs.autopairs_bs()
        end
      end, opts)
    end
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
      --'p00f/nvim-ts-rainbow',
      'HiPhish/nvim-ts-rainbow2',
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
  'folke/which-key.nvim',
  'folke/todo-comments.nvim',
  {
    'norcalli/nvim-colorizer.lua',
    config = function()
      require('colorizer').setup()
    end
  },
  {
    'folke/neodev.nvim',
    config = function()
      require('neodev').setup()
    end
  },
})
