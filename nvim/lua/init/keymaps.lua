local opts = { noremap = true, silent = true }
local keymap = vim.keymap.set

keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

keymap("n", "<leader>ve", ":edit ~/.config/nvim/init.lua<cr>", {})
keymap("n", "<leader>vr", ":source ~/.config/nvim/init.lua<cr>", {})

-- Reselect visual selection after indenting
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- When text is wrapped, move by terminal rows, not lines, unless a count is provided
keymap("", "j", function() return vim.v.count > 1 and 'j' or 'gj' end, { noremap = true, silent = true, expr = true })
keymap("", "k", function() return vim.v.count > 1 and 'k' or 'gk' end, { noremap = true, silent = true, expr = true })

-- Easy insertion of a trailing ; or , from insert mode
keymap("i", ";;", "<Esc>A;<Esc>", {});
keymap("i", ",,", "<Esc>A,<Esc>", {});

-- cmap w!! %!sudo tee > /dev/null %

keymap('n', '<leader>x', ':bw<cr>', opts)
keymap('n', '<leader>b', ':ls<cr>:b<space>', { noremap = true });
keymap('n', '<leader>n', ':Explore<cr>', { noremap = true });

keymap('n', '<C-d>', '<C-d>zz', opts)
keymap('n', '<C-u>', '<C-u>zz', opts)
keymap('n', 'n', 'nzz', opts)
keymap('n', 'N', 'Nzz', opts)

