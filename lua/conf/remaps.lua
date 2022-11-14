local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- clean search
keymap("n", "<Leader>/", ':let @/ =""<CR>', { silent = true })

-- better window movement
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- saving
keymap("n", "<C-s>", ":w<CR>", { noremap = true })
keymap("i", "<C-s>", "<Esc>:w<CR>", { noremap = true })

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)

-- move selected line / block of text in visual mode
keymap("x", "K", ":move '<-2<CR>gv-gv", { noremap = true, silent = true })
keymap("x", "J", ":move '>+1<CR>gv-gv", { noremap = true, silent = true })

-- Nvimtree
keymap("n", "<leader>e", ":NvimTreeToggle<cr>", opts)

-- buffer and window
keymap("n", "<leader>bk", ":Bdelete<cr>", opts)
keymap("n", "<leader>q", ":q<cr>", opts)

-- tmux sessionizer
keymap("n", "<C-f>", ":silent !tmux neww tmux-sessionizer<CR>", opts)
