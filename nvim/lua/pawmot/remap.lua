local opts = { noremap = true, silent = true }

vim.keymap.set("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "

vim.keymap.set("n", "<leader>vr", ":source ~/.config/nvim/init.lua<cr>", {})

-- Reselect visual selection after indenting
vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)

-- When text is wrapped, move by terminal rows, not lines, unless a count is provided
vim.keymap.set("", "j", function() return vim.v.count > 1 and 'j' or 'gj' end, { noremap = true, silent = true, expr = true })
vim.keymap.set("", "k", function() return vim.v.count > 1 and 'k' or 'gk' end, { noremap = true, silent = true, expr = true })

-- Easy insertion of a trailing ; or , from insert mode
vim.keymap.set("i", ";;", "<Esc>A;<Esc>", {});
vim.keymap.set("i", ",,", "<Esc>A,<Esc>", {});

-- cmap w!! %!sudo tee > /dev/null %

vim.keymap.set('n', '<leader>x', vim.cmd.bw, opts)
vim.keymap.set('n', '<leader>b', ':ls<cr>:b<space>', { noremap = true });
vim.keymap.set('n', '<leader>n', vim.cmd.Explore, { noremap = true });

vim.keymap.set('n', '<C-d>', '<C-d>zz', opts)
vim.keymap.set('n', '<C-u>', '<C-u>zz', opts)
vim.keymap.set('n', 'n', 'nzz', opts)
vim.keymap.set('n', 'N', 'Nzz', opts)

