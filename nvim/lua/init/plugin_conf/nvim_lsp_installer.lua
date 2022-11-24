local nvim_lsp_intaller = {}

function nvim_lsp_intaller.register(packer_use)
  packer_use {
    'williamboman/nvim-lsp-installer',
    after = { 
      --'coq_nvim', 
      'nvim-lspconfig' 
    },
    optional = false,
    config = function() 
      -- Register a handler that will be called for each installed server when it's ready (i.e. when installation is finished
      -- or if the server is already installed).
      local lsp_installer = require('nvim-lsp-installer')
      --local coq = require('coq')
      lsp_installer.on_server_ready(function(server)
          local opts = {
            on_attach = function(client, bufnr)
              local map_opts = { noremap=true, silent=true }
              -- Enable completion triggered by <c-x><c-o>
              vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

              -- Mappings.
              -- See `:help vim.lsp.*` for documentation on any of the below functions
              -- TODO: consider maps with <space>
              vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', map_opts)
              vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', map_opts)
              vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', map_opts)
              vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', map_opts)
              vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', map_opts)
              --vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', map_opts)
              --vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', map_opts)
              --vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', map_opts)
              --vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', map_opts)
              vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', map_opts)
              vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', map_opts)
              vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', map_opts)
              vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>fmt', '<cmd>lua vim.lsp.buf.formatting()<CR>', map_opts)
            end
          }

          -- (optional) Customize the options passed to the server
          -- if server.name == "tsserver" then
          --     opts.root_dir = function() ... end
          -- end

          -- This setup() function will take the provided server configuration and decorate it with the necessary properties
          -- before passing it onwards to lspconfig.
          -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
          server:setup(opts)
          --server:setup(coq.lsp_ensure_capabilities(opts))
      end)
    end
  }
end

return nvim_lsp_intaller

