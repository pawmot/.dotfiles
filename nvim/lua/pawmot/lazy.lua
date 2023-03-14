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
  },
  {
    'akinsho/bufferline.nvim',
    version = '3.*'
  },
  'airblade/vim-rooter',
  'editorconfig/editorconfig-vim',
  'tpope/vim-fugitive',
  {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup {
        on_attach = function(bufnr)
          local gs = package.loaded.gitsigns

          local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
          end

          -- Navigation
          map('n', ']c', function()
            if vim.wo.diff then return ']c' end
            vim.schedule(function() gs.next_hunk() end)
            return '<Ignore>'
          end, { expr = true })

          map('n', '[c', function()
            if vim.wo.diff then return '[c' end
            vim.schedule(function() gs.prev_hunk() end)
            return '<Ignore>'
          end, { expr = true })

          -- Actions
          map({ 'n', 'v' }, '<leader>hs', ':Gitsigns stage_hunk<CR>')
          map({ 'n', 'v' }, '<leader>hr', ':Gitsigns reset_hunk<CR>')
          map('n', '<leader>hS', gs.stage_buffer)
          map('n', '<leader>hu', gs.undo_stage_hunk)
          map('n', '<leader>hR', gs.reset_buffer)
          map('n', '<leader>hp', gs.preview_hunk)
          map('n', '<leader>hb', function() gs.blame_line { full = true } end)
          map('n', '<leader>tb', gs.toggle_current_line_blame)
          map('n', '<leader>hd', gs.diffthis)
          map('n', '<leader>hD', function() gs.diffthis('~') end)
          map('n', '<leader>td', gs.toggle_deleted)

          -- Text object
          map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
        end
      }
    end
  },
  'lukas-reineke/indent-blankline.nvim',
  {
    'phaazon/hop.nvim',
    version = 'v2'
  },
  {
    'windwp/nvim-autopairs',
    config = function()
      require('nvim-autopairs').setup()
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
        dependencies = {
          { 'jose-elias-alvarez/null-ls.nvim' }
        },
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
      'mfussenegger/nvim-treehopper',
      'RRethy/nvim-treesitter-endwise'
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
  {
    'rcarriga/nvim-notify',
    config = function()
      local notify = require('notify')
      vim.notify = notify
    end
  },
  {
    'mrded/nvim-lsp-notify',
    config = function()
      require('lsp-notify').setup({
        notify = require('notify')
      })
    end
  }
})
