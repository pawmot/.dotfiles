language_support = {}

function language_support.register(packer_use)
  packer_use {
    'williamboman/mason.nvim',
    requires = {
      'williamboman/mason-lspconfig.nvim',
      'neovim/nvim-lspconfig',
      'simrat39/rust-tools.nvim'
    },
    after = 'coq_nvim',
    config = function()
      require('mason').setup()
      require('mason-lspconfig').setup({
        ensure_installed = { 'sumneko_lua', 'rust_analyzer' }
      })

      local opts = { noremap=true, silent=true }
      vim.keymap.set('n', '<space>d', vim.diagnostic.open_float, opts)
      vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
      vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
      vim.keymap.set('n', '<space>Q', vim.diagnostic.setloclist, opts)

      local get_bufopts = function(bufnr) return { noremap=true, silent=true, buffer=bufnr } end
      local on_attach = function (client, bufnr)
        -- Enable completion triggered by <c-x><c-o>
        vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

        -- Mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local bufopts = get_bufopts(bufnr)
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
        vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
        vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
        vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
        vim.keymap.set('n', '<space>wl', function()
          print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, bufopts)
        vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
        vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
        vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
        vim.keymap.set('n', '<space>fmt', function() vim.lsp.buf.format { async = true } end, bufopts)
      end

      local lsp_flags = {
        debounce_text_changes = 150,
      }

      local coq = require('coq')
      
      require('mason-lspconfig').setup_handlers {
        function (server_name)
          require('lspconfig')[server_name].setup(coq.lsp_ensure_capabilities({
            on_attach = on_attach,
            flags = lsp_flags
          }))
        end,
        ['rust_analyzer'] = function ()
          local rt = require('rust-tools')
          rt.setup({
            server = coq.lsp_ensure_capabilities({
              on_attach = function(client, bufnr)
                on_attach(client, bufnr)
                local bufopts = get_bufopts(bufnr)
                vim.keymap.set("n", "<Leader>rh", rt.hover_actions.hover_actions, bufopts)
                vim.keymap.set("n", "<Leader>rc", rt.code_action_group.code_action_group, bufopts)
                vim.keymap.set("n", "<Leader>rr", rt.runnables.runnables, bufopts)
              end,
              flags = lsp_flags
            }),
            tools = {
              hover_actions = {
                auto_focus = true
              }
            }
          })
        end,
        ['sumneko_lua'] = function ()
          require('lspconfig').sumneko_lua.setup(coq.lsp_ensure_capabilities({
            on_attach = on_attach,
            flags = lsp_flags,
            settings = {
              Lua = {
                diagnostics = {
                  globals = { 'vim' }
                }
              }
            }
          }))
        end,
      }
    end
  }
end

return language_support

