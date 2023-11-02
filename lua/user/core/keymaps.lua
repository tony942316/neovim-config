-- define options
local opts = {
    noremap = true,                                 -- non-recursive... idk someone said this was important
    silent = true                                   -- don't talk to me
}

-- vim.keymap.set(.....) too long ain't got time for that
keymapN = function(new, old)
    vim.keymap.set("n", new, old, opts)
end
keymapI = function(new, old)
    vim.keymap.set("i", new, old, opts)
end
keymapV = function(new, old)
    vim.keymap.set("v", new, old, opts)
end
keymapT = function(new, old)
    vim.keymap.set("t", new, old, opts)
end

vim.keymap.set("", "<Space>", "<Nop>", opts)        -- just in case
vim.g.mapleader = " "                               -- space is a good leader

-----------------
-- NORMAL MODE --
-----------------

-- Window Navigation
keymapN("<C-h>", "<C-w>h")                          -- left
keymapN("<C-j>", "<C-w>j")                          -- down
keymapN("<C-k>", "<C-w>k")                          -- up
keymapN("<C-l>", "<C-w>l")                          -- right

-- Buffer Navigation
keymapN("<S-l>", ":bnext<CR>")
keymapN("<S-h>", ":bprevious<CR>")
keymapN("<S-q>", "<cmd>Bdelete!<CR>")

-- Window Resizing
keymapN("<C-Up>", ":resize -2<CR>")
keymapN("<C-Down>", ":resize +2<CR>")
keymapN("<C-Left>", ":vertical resize -2<CR>")
keymapN("<C-Right>", ":vertical resize +2<CR>")

-- give me a terminal
keymapN("<leader>t", ":terminal<CR>")

-- Quick Save
keymapN("<leader>s", "<cmd>w<CR>")
keymapN("<leader>q", "<cmd>NvimTreeClose<CR><cmd>wq<CR>")

-----------------
-- VISUAL MODE --
-----------------

-- why would "<" exit visual mode?
keymapV("<", "<gv")
keymapV(">", ">gv")

-- when pasting overwrites your clipboard...
keymapV("p", "P")

-----------------
-- INSERT MODE --
-----------------

-- esc is just so far away...
keymapI("jk", "<ESC>")

-------------------
-- TERMINAL MODE --
-------------------

-- some of these maps are just crazy
keymapT("jk", "<C-\\><C-N>")

---------------
-- TELESCOPE --
---------------

keymapN("<leader>ff", ":Telescope find_files<CR>")
keymapN("<leader>ft", ":Telescope live_grep<CR>")
keymapN("<leader>fp", ":Telescope projects<CR>")
keymapN("<leader>fb", ":Telescope buffers<CR>")
