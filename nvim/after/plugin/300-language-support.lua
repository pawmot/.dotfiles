local ok, mason = pcall(require, "mason")

if not ok then
    print("could not load mason")
else
    vim.g.coq_settings = {
        ["auto_start"] = "shut-up",
        ["display.ghost_text.context"] = { " ⟪ ", " ⟫ " },
        ["keymap"] = { recommended = false },
    }

    require("coq_3p")({
        { src = "copilot", short_name = "COP", accept_key = "<c-f>" },
    })

    mason.setup()
    require("mason-tool-installer").setup({
        ensure_installed = {
            "clangd",
            "codelldb",
            "css-lsp",
            "delve",
            "eslint-lsp",
            "goimports",
            "golangci-lint",
            "gopls",
            "java-debug-adapter",
            "jdtls",
            "js-debug-adapter",
            "kotlin-debug-adapter",
            "kotlin-language-server",
            "lua-language-server",
            "rust-analyzer",
            "stylua",
            "tailwindcss-language-server",
            "typescript-language-server",
        },
    })
    local opts = { noremap = true, silent = true }
    -- TODO: think about another keymap
    --vim.keymap.set('n', '<space>q', vim.diagnostic.open_float, opts)
    vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
    vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
    vim.keymap.set("n", "<space>Q", vim.diagnostic.setloclist, opts)

    local get_bufopts = function(bufnr)
        return { noremap = true, silent = true, buffer = bufnr }
    end
    local on_attach = function(client, bufnr)
        -- Enable completion triggered by <c-x><c-o>
        vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

        -- Mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local bufopts = get_bufopts(bufnr)
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
        vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
        vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, bufopts)
        vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
        vim.keymap.set("n", "<space>wl", function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, bufopts)
        vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, bufopts)
        vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, bufopts)
        vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, bufopts)
        vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
        vim.keymap.set("n", "<space>fmt", function()
            vim.lsp.buf.format({ async = true })
        end, bufopts)

        -- require("lsp_signature").on_attach({
        --     bind = true, -- This is mandatory, otherwise border config won't get registered.
        --     toggle_key = "<M-;>",
        --     select_signature_key = "<M-n>",
        --     hint_prefix = "🦀 ",
        --     hint_enable = true,
        --     floating_window = false,
        --     check_completion_visible = true,
        --     handler_opts = {
        --         border = "rounded",
        --     },
        -- }, bufnr)

    end

    local lsp_flags = {
        debounce_text_changes = 150,
    }

    local coq = require("coq")

    vim.api.nvim_create_autocmd("LspAttach", {
      callback = function(ev)
        local client = vim.lsp.get_client_by_id(ev.data.client_id)
        local function toSnakeCase(str)
          return string.gsub(str, "%s*[- ]%s*", "_")
        end

        if client.name == 'omnisharp' then
          local tokenModifiers = client.server_capabilities.semanticTokensProvider.legend.tokenModifiers
          for i, v in ipairs(tokenModifiers) do
            tokenModifiers[i] = toSnakeCase(v)
          end
          local tokenTypes = client.server_capabilities.semanticTokensProvider.legend.tokenTypes
          for i, v in ipairs(tokenTypes) do
            tokenTypes[i] = toSnakeCase(v)
          end
        end
      end,
    })
    require("mason-lspconfig").setup({})
    require("mason-lspconfig").setup_handlers({
        function(server_name)
            require("lspconfig")[server_name].setup(coq.lsp_ensure_capabilities({
                on_attach = on_attach,
                flags = lsp_flags,
            }))
        end,
        ["tsserver"] = function()
            require("lspconfig").tsserver.setup(coq.lsp_ensure_capabilities({
                on_attach = on_attach,
                flags = lsp_flags,
            }))
        end,
        ["elixirls"] = function()
            local mason_registry = require("mason-registry")
            local elixirls = mason_registry.get_package("elixir-ls")
            local elixirls_path = elixirls:get_install_path()
            require("lspconfig").elixirls.setup(coq.lsp_ensure_capabilities({
                cmd = { elixirls_path .. "/language_server.sh" },
                on_attach = on_attach,
                flags = lsp_flags,
            }))
        end,
        ["omnisharp"] = function()
            require("lspconfig").omnisharp.setup(coq.lsp_ensure_capabilities({
                cmd = { "omnisharp", "--languageserver", "--hostPID", tostring(vim.fn.getpid()) },
                on_attach = on_attach,
                flags = lsp_flags,
            }))
        end,
        ["rust_analyzer"] = function()
            local rt = require("rust-tools")
            local mason_registry = require("mason-registry")
            local codelldb = mason_registry.get_package("codelldb")
            local extension_path = codelldb:get_install_path()
            local codelldb_path = extension_path .. "/extension/adapter/codelldb"
            local liblldb_path = extension_path .. "/extension/lldb/lib/liblldb.so"
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
                }),
                tools = {
                    hover_actions = {
                        auto_focus = true,
                    },
                },
                dap = {
                    adapter = require("rust-tools.dap").get_codelldb_adapter(codelldb_path, liblldb_path),
                },
            })
        end,
        ["lua_ls"] = function()
            require("lspconfig").lua_ls.setup(coq.lsp_ensure_capabilities({
                on_attach = on_attach,
                flags = lsp_flags,
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { "vim" },
                        },
                    },
                },
            }))
        end,
        ["gopls"] = function()
            require("go").setup()
            require("lspconfig")["gopls"].setup(coq.lsp_ensure_capabilities({
                on_attach = on_attach,
                flags = lsp_flags,
                settings = {
                    gopls = {
                        hints = {
                            assignVariableTypes = true,
                            compositeLiteralFields = true,
                            compositeLiteralTypes = true,
                            constantValues = true,
                            functionTypeParameters = true,
                            parameterNames = true,
                            rangeVariableTypes = true,
                        }
                    }
                }
            }))
        end,
        ["clangd"] = function()
            require("lspconfig")["clangd"].setup(coq.lsp_ensure_capabilities({
                on_attach = on_attach,
                flags = lsp_flags,
                capabilities = {
                    offsetEncoding = { "utf-16" },
                },
            }))
        end,
    })

    require("lspconfig").gleam.setup({
        on_attach = on_attach,
        flags = lsp_flags,
    })

    local lsp_lines = require("lsp_lines")
    lsp_lines.setup()
    vim.keymap.set("n", "<leader>l", lsp_lines.toggle, opts)
    -- start with lsp_lines off
    lsp_lines.toggle()
    require("trouble").setup({})

    vim.keymap.set("n", "<leader>qx", "<cmd>TroubleToggle<cr>", opts)
    vim.keymap.set("n", "<leader>qw", "<cmd>TroubleToggle workspace_diagnostics<cr>", opts)
    vim.keymap.set("n", "<leader>qd", "<cmd>TroubleToggle document_diagnostics<cr>", opts)
    vim.keymap.set("n", "<leader>ql", "<cmd>TroubleToggle loclist<cr>", opts)
    vim.keymap.set("n", "<leader>qq", "<cmd>TroubleToggle quickfix<cr>", opts)
    vim.keymap.set("n", "<leader>gR", "<cmd>TroubleToggle lsp_references<cr>", opts)

    local null_ls = require("null-ls")
    null_ls.setup({
        sources = {
            null_ls.builtins.formatting.stylua,
            null_ls.builtins.formatting.prettier,
            null_ls.builtins.formatting.eslint_d,
            null_ls.builtins.formatting.shfmt,
            null_ls.builtins.formatting.sqlformat,
            null_ls.builtins.formatting.black,
            null_ls.builtins.formatting.goimports,
            null_ls.builtins.formatting.gofmt,
            null_ls.builtins.formatting.rustfmt,
            null_ls.builtins.formatting.mix,
            null_ls.builtins.completion.spell,
        },
    })
    require("crates").setup({
        src = {
            coq = {
                enabled = true,
                name = "crates",
            },
        },
        null_ls = {
            enabled = true,
            name = "crates.nvim",
        },
    })

    -- TODO: find out why autostart isn't working
    vim.cmd.COQnow()

    local symbols_outline = require("symbols-outline")
    symbols_outline.setup()
    vim.keymap.set("n", "<space>S", symbols_outline.toggle_outline, opts)
    -- TODO: look into disabling sign column in the outline

    --require('nvim-autopairs').setup {}

    local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
    for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    --require('lspsaga').setup({})
end
