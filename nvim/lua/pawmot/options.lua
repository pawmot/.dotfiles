vim.opt.fileencoding = "UTF-8"
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.hidden = true
vim.opt.signcolumn = "yes:2"
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.number = true
vim.opt.termguicolors = true
vim.opt.undofile = true
--vim.opt.spell = true
vim.opt.title = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.wildmode = { "longest:full", "full" }
vim.opt.wrap = true
vim.opt.list = true
vim.opt.listchars = { tab = "▸\\", space = "·", extends = "»", precedes = "«", nbsp = "⣿" }
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
vim.opt.joinspaces = false
vim.opt.splitright = true
vim.opt.clipboard = "unnamedplus"
vim.opt.confirm = true
vim.opt.backup = false
--vim.opt.backupdir = "${XDG_DATA_HOME}/nvim/backup//"
vim.opt.updatetime = 300 -- Reduce time for highlighting other references
vim.opt.redrawtime = 10000 -- Allow more time for loading syntax on large files
vim.opt.cmdheight = 1
vim.opt.mouse = ""

