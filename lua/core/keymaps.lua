-- define options
local opts = {
    noremap = true,             -- non-recursive... idk someone said this was important
    silent = true               -- don't talk to me
}

-- Set Leader Key
vim.keymap.set("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "

-- Buffer Control
vim.keymap.set("n", "<S-l>", "<cmd>bn<CR>", opts)
vim.keymap.set("n", "<S-h>", "<cmd>bp<CR>", opts)
vim.keymap.set("n", "<S-q>", "<cmd>bd<CR>", opts)
vim.keymap.set("n", "<S-e>", "<cmd>Explore<CR>", opts)
vim.keymap.set("n", "<leader>b", ":b ", opts)

-- Quick Save
vim.keymap.set("n", "<leader>s", "<cmd>w<CR>", opts)

-- Visual Indenting
vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)

-- Stop Paste Overwriting
vim.keymap.set("v", "p", "P", opts)

vim.keymap.set("n", "<leader>e", "<cmd>Explore<CR>", opts)

vim.keymap.set("i", "jk", "<ESC>", opts)

--vim.keymap.set("t", "jk", "<C-\\><C-N>", opts)
