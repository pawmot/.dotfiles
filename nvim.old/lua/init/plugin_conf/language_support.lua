local M = {}

function M.register(packer_use)
  packer_use {
    'williamboman/mason.nvim',
    requires = {
      'williamboman/mason-lspconfig.nvim',
      'neovim/nvim-lspconfig',
      'ray-x/lsp_signature.nvim',
      'https://git.sr.ht/~whynothugo/lsp_lines.nvim',
      'simrat39/rust-tools.nvim',
      'ray-x/go.nvim',
      'folke/trouble.nvim'
    },
    after = 'coq_nvim',
    config = function()
      require('mason').setup()
      require('mason-lspconfig').setup({
        ensure_installed = { 'lua_ls', 'rust_analyzer' }
      })

      local opts = { noremap = true, silent = true }
      -- TODO: think about another keymap
      --vim.keymap.set('n', '<space>q', vim.diagnostic.open_float, opts)
      vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
      vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
      vim.keymap.set('n', '<space>Q', vim.diagnostic.setloclist, opts)

      local get_bufopts = function(bufnr) return { noremap = true, silent = true, buffer = bufnr } end
      local on_attach = function(client, bufnr)
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

        --[[require('lsp_signature').on_attach(
          {
            bind = true, -- This is mandatory, otherwise border config won't get registered.
            handler_opts = {
              border = "rounded"
            }
          },
          bufnr
        )]]--
      end

      local lsp_flags = {
        debounce_text_changes = 150,
      }

      local coq = require('coq')

      require('mason-lspconfig').setup_handlers {
        function(server_name)
          require('lspconfig')[server_name].setup(coq.lsp_ensure_capabilities({
            on_attach = on_attach,
            flags = lsp_flags
          }))
        end,
        ['rust_analyzer'] = function()
          local rt = require('rust-tools')
          local mason_registry = require("mason-registry")
          local codelldb = mason_registry.get_package("codelldb")
          local extension_path = codelldb:get_install_path()
          local codelldb_path = extension_path .. '/extension/adapter/codelldb'
          local liblldb_path = extension_path .. '/extension/lldb/lib/liblldb.so'
          rt.setup({
            server = coq.lsp_ensure_capabilities({
              on_attach = function(client, bufnr)
                on_attach(client, bufnr)
                local bufopts = get_bufopts(bufnr)
                vim.keymap.set("n", "<Leader>rh", rt.hover_actions.hover_actions, bufopts)
                vim.keymap.set("n", "<Leader>rc", rt.code_action_group.code_action_group, bufopts)
                vim.keymap.set("n", "<Leader>rr", rt.runnables.runnables, bufopts)
              end,
              flags = lsp_flags,
              settings = {
                ["rust-analyzer"] = {
                  -- TODO: https://github.com/simrat39/rust-tools.nvim/issues/300
                 inlayHints = { locationLinks = false }
                }
              }
            }),
            tools = {
              hover_actions = {
                auto_focus = true
              }
            },
            dap = {
              adapter = require('rust-tools.dap').get_codelldb_adapter(
                codelldb_path, liblldb_path)
            }
          })
        end,
        ['lua_ls'] = function()
          require('lspconfig').lua_ls.setup(coq.lsp_ensure_capabilities({
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
        ['gopls'] = function()
          require('go').setup()
          require('lspconfig')['gopls'].setup(coq.lsp_ensure_capabilities({
            on_attach = on_attach,
            flags = lsp_flags
          }))
        end
      }

      --require('lsp_lines').setup()
      require('trouble').setup {
      }

      vim.keymap.set('n', '<leader>qx', '<cmd>TroubleToggle<cr>', opts)
      vim.keymap.set('n', '<leader>qw', '<cmd>TroubleToggle workspace_diagnostics<cr>', opts)
      vim.keymap.set('n', '<leader>qd', '<cmd>TroubleToggle document_diagnostics<cr>', opts)
      vim.keymap.set('n', '<leader>ql', '<cmd>TroubleToggle loclist<cr>', opts)
      vim.keymap.set('n', '<leader>qq', '<cmd>TroubleToggle quickfix<cr>', opts)
      vim.keymap.set('n', '<leader>gR', '<cmd>TroubleToggle lsp_references<cr>', opts)
    end
  }
end

return M
