vim.api.nvim_create_autocmd("PackChanged", { callback = function(ev)
  local name, kind = ev.data.spec.name, ev.data.kind
  if name == "nvim-treesitter" and (kind == "install" or kind == "update") then
    if not ev.data.active then vim.cmd.packadd("nvim-treesitter") end
    vim.cmd("TSUpdate")
  end
end })

vim.pack.add({
    "https://github.com/folke/which-key.nvim", 
    "https://github.com/EdenEast/nightfox.nvim",
    "https://github.com/nvim-treesitter/nvim-treesitter",
    "https://github.com/nvim-treesitter/nvim-treesitter-context",
    "https://github.com/romus204/tree-sitter-manager.nvim",
    "https://github.com/nvim-mini/mini.nvim",
    "https://github.com/mason-org/mason.nvim",
    "https://github.com/mason-org/mason-lspconfig.nvim",
    "https://github.com/neovim/nvim-lspconfig",
    { src = "https://github.com/saghen/blink.cmp", version = vim.version.range("1.x") },
    "https://github.com/stevearc/conform.nvim",
    "https://github.com/lewis6991/gitsigns.nvim",
})

local wkey = require("which-key")
wkey.setup({
    preset = "helix",
    opts = {
        triggers = {
            {'<auto>', mode = 'nxso' },
            {'<leader>', mode = {'n', 'v'}}
        }
    }
})
wkey.add({
    {"?", function() wkey.show({global = true}) end, desc = "Global keymaps"},
    {"<leader>?", function() wkey.show({global = false}) end, desc = "Buffer local keymaps"}
})

wkey.add({
    mode = "n",
    {"<leader>v", group="NVim stuff"},
    {"<leader>vr", "<cmd>source ~/.config/nvim/init.lua<cr>", desc="Reload config"},
    {"<leader>vp", group="vim.pack stuff"},
    {"<leader>vpu", vim.pack.update, desc="Update plugins"},
    {"<leader>vpo", function() vim.pack.update({}, { offline = true }) end, desc="Sync plugins with lockfile (offline update)"},
    {"<leader>x", vim.cmd.bw, desc="Close current buffer"},
    {"<leader>n", vim.cmd.Explore, desc="Netrw"},
    {"<leader>b", group="buffers", expand=function()
        return require("which-key.extras").expand.buf()
    end
    },
    { "<leader>w", proxy = "<c-w>", group = "windows" }
})

require("nightfox").setup({
    options = {
        styles = {
            comments = "italic",
            conditionals = "NONE",
            constants = "NONE",
            functions = "NONE",
            keywords = "italic",
            qualifiers = "italic",
            numbers = "NONE",
            operators = "NONE",
            strings = "NONE",
            types = "NONE",
            variables = "NONE",
        },
    },
    groups = {
        all = {
            ["@type.qualifier"] = { link = "@keyword" },
            ["@lsp.mod.mutable"] = { style = "underline" },
            ["@lsp.mod.async"] = { style = "bold,italic" },
        },
    },
})
vim.cmd.colorscheme("carbonfox")

require("nvim-treesitter").setup()
require("treesitter-context").setup({ max_lines = 3 })

require("tree-sitter-manager").setup({
    auto_install = true
})

require("mini.pick").setup()
wkey.add({
    {"<leader>f", group="Find"},
    {"<leader>ff", MiniPick.builtin.files, desc="Find files"},
    {"<leader>fg", MiniPick.builtin.grep_live, desc="Grep files"},
})

require("blink.cmp").setup({
  keymap = { preset = "default" },
  sources = { default = { "lsp", "path", "buffer" } },
})

local capabilities = require("blink.cmp").get_lsp_capabilities()

vim.lsp.config("*", { capabilities = capabilities })

require('mason').setup()
require('mason-lspconfig').setup({
    automatic_enable = true
})

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(ev)
      require("which-key").add({
        { "gd", vim.lsp.buf.definition, desc = "Go to definition", buffer = ev.buf },
        { "gi", vim.lsp.buf.implementation, desc = "Go to implementation", buffer = ev.buf },
        { "gr", vim.lsp.buf.references, desc = "References", buffer = ev.buf },
        { "K", vim.lsp.buf.hover, desc = "Hover", buffer = ev.buf },
        { "<C-k>", vim.lsp.buf.signature_help, desc = "Signature help", buffer = ev.buf },
        { "<leader>l", group = "LSP" },
        { "<leader>la", vim.lsp.buf.code_action, desc = "Code action", buffer = ev.buf },
        { "<leader>lr", vim.lsp.buf.rename, desc = "Rename", buffer = ev.buf },
        { "<leader>ld", vim.diagnostic.open_float, desc = "Diagnostics", buffer = ev.buf },
        { "<leader>lf", function() vim.lsp.buf.format({ async=true }) end, desc="Format", buffer = ev.buf }
      })
  end,
})

require("conform").setup({
    formatters_by_ft = {
        python = { "" }
    }
})

require("gitsigns").setup({
    on_attach = function(bufnr)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
        end

        -- Navigation
        map("n", "]c", function()
            if vim.wo.diff then
                return "]c"
            end
            vim.schedule(function()
                gs.next_hunk()
            end)
            return "<Ignore>"
        end, { expr = true })

        map("n", "[c", function()
            if vim.wo.diff then
                return "[c"
            end
            vim.schedule(function()
                gs.prev_hunk()
            end)
            return "<Ignore>"
        end, { expr = true })

        -- Actions
        map({ "n", "v" }, "<leader>hs", ":Gitsigns stage_hunk<CR>")
        map({ "n", "v" }, "<leader>hr", ":Gitsigns reset_hunk<CR>")
        map("n", "<leader>hS", gs.stage_buffer)
        map("n", "<leader>hu", gs.undo_stage_hunk)
        map("n", "<leader>hR", gs.reset_buffer)
        map("n", "<leader>hp", gs.preview_hunk)
        map("n", "<leader>hb", function()
            gs.blame_line({ full = true })
        end)
        map("n", "<leader>tb", gs.toggle_current_line_blame)
        map("n", "<leader>hd", gs.diffthis)
        map("n", "<leader>hD", function()
            gs.diffthis("~")
        end)
        map("n", "<leader>td", gs.toggle_deleted)

        -- Text object
        map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>")
    end,
})
