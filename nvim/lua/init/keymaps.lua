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
--keymap("", "<silent> <expr> j (v:count == 0 ? 'gj' : 'j')
--noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

-- Easy insertion of a trailing ; or , from insert mode
keymap("i", ";;", "<Esc>A;<Esc>", {});
keymap("i", ",,", "<Esc>A,<Esc>", {});

--cmap w!! %!sudo tee > /dev/null %

keymap('n', '<leader>q', ':bw<cr>', opts)
keymap('n', '<leader>b', ':ls<cr>:b<space>', { noremap = true });
keymap('n', '<leader>n', ':Explore<cr>', { noremap = true });

