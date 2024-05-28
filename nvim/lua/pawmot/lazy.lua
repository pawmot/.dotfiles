local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	{
		"folke/tokyonight.nvim",
		priority = 1000,
		lazy = false,
		config = function()
			require("tokyonight").setup({
				lualine_bold = true,
			})
			-- vim.cmd.colorscheme 'tokyonight-night'
		end,
	},
	{
		"EdenEast/nightfox.nvim",
		priority = 1000,
		lazy = false,
		config = function()
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
		end,
	},
	"nvim-lua/plenary.nvim",
	"nvim-lua/popup.nvim",
	{
		"stevearc/dressing.nvim",
		config = function()
			require("dressing").setup({
				input = {
					insert_only = false,
					start_in_insert = false,
				},
			})
		end,
	},
	"kyazdani42/nvim-web-devicons",
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "make",
	},
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-telescope/telescope-file-browser.nvim",
		},
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = {
			"arkav/lualine-lsp-progress",
		},
	},
	{
		"akinsho/bufferline.nvim",
		-- version = "3.*",
        branch = 'main',
	},
	"airblade/vim-rooter",
	"editorconfig/editorconfig-vim",
	"tpope/vim-fugitive",
	{
		"lewis6991/gitsigns.nvim",
		config = function()
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
		end,
	},
	{
		"sindrets/diffview.nvim",
		enabled = false,
		config = function()
			require("diffview").setup({})
		end,
	},
	{ "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },
	{
		"phaazon/hop.nvim",
		version = "v2",
	},
	{
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup()
		end,
	},
	{
		"williamboman/mason.nvim",
		dependencies = {
			"WhoIsSethDaniel/mason-tool-installer.nvim",
			"williamboman/mason-lspconfig.nvim",
			"neovim/nvim-lspconfig",
			"ray-x/lsp_signature.nvim",
			"simrat39/rust-tools.nvim",
			"ray-x/go.nvim",
			"https://git.sr.ht/~whynothugo/lsp_lines.nvim",
			"folke/trouble.nvim",
			"simrat39/symbols-outline.nvim",
			{
				"glepnir/lspsaga.nvim",
				event = "Bufread",
			},
			{
				"saecki/crates.nvim",
				dependencies = {
					{ "jose-elias-alvarez/null-ls.nvim" },
				},
				event = "Bufread Cargo.toml",
				config = function()
					require("crates").setup({
						null_ls = {
							enabled = true,
							name = "crates.nvim",
						},
					})
				end,
			},
			{
				"ms-jpq/coq_nvim",
				branch = "coq",
				dependencies = {
					{ "ms-jpq/coq.artifacts", branch = "artifacts" },
					{ "ms-jpq/coq.thirdparty", branch = "3p" },
				},
				build = ":COQdeps",
			},
		},
	},
	{
		"nvim-treesitter/nvim-treesitter",
		dependencies = {
			"HiPhish/rainbow-delimiters.nvim",
			"JoosepAlviste/nvim-ts-context-commentstring",
			"nvim-treesitter/nvim-treesitter-context",
			"nvim-treesitter/playground",
			"mfussenegger/nvim-treehopper",
			"RRethy/nvim-treesitter-endwise",
			"windwp/nvim-ts-autotag",
		},
		build = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
	},
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"theHamsta/nvim-dap-virtual-text",
            "nvim-neotest/nvim-nio",
			"rcarriga/nvim-dap-ui",
		},
	},
	{
		"ellisonleao/glow.nvim",
		config = function()
			require("glow").setup()
		end,
	},
	{
		"mbbill/undotree",
		config = function()
			local opts = { noremap = true }
			vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, opts)
		end,
	},
	"github/copilot.vim",
	"David-Kunz/jester",
	"folke/which-key.nvim",
	"folke/todo-comments.nvim",
	{
		"NvChad/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup({
				user_default_options = {
					RRGGBBAA = true,
					tailwind = true,
				},
			})
		end,
	},
	{
		"folke/neodev.nvim",
		config = function()
			require("neodev").setup()
		end,
	},
	{
		"rcarriga/nvim-notify",
		enabled = false,
		config = function()
			---@diagnostic disable-next-line: unused-local
			local notify = require("notify")
			--vim.notify = notify
		end,
	},
	{
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	},
	{
		"chentoast/marks.nvim",
		config = function()
			require("marks").setup()
		end,
	},
	{
		"ray-x/guihua.lua",
	},
	{
		"j-hui/fidget.nvim",
		config = function()
			require("fidget").setup({})
		end,
	},
	{
		"folke/noice.nvim",
		dependencies = {
			"MunifTanjim/nui.nvim",
		},
		config = function()
			require("noice").setup({
				popupmenu = {
					enabled = false,
				},
				lsp = {
					-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
					override = {
						["vim.lsp.util.convert_input_to_markdown_lines"] = true,
						["vim.lsp.util.stylize_markdown"] = true,
						["cmp.entry.get_documentation"] = true,
					},
				},
				-- you can enable a preset for easier configuration
				presets = {
					bottom_search = true, -- use a classic bottom cmdline for search
					command_palette = true, -- position the cmdline and popupmenu together
					long_message_to_split = true, -- long messages will be sent to a split
					inc_rename = false, -- enables an input dialog for inc-rename.nvim
					lsp_doc_border = false, -- add a border to hover docs and signature help
				},
			})
		end,
	},
})
