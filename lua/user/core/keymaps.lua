-- define options
local opts = {
    noremap = true,                                 -- non-recursive... idk someone said this was important
    silent = true                                   -- don't talk to me
}

-- vim.keymap.set(.....) too long ain't got time for that
KeymapN = function(new, old)
    vim.keymap.set("n", new, old, opts)
end
KeymapI = function(new, old)
    vim.keymap.set("i", new, old, opts)
end
KeymapV = function(new, old)
    vim.keymap.set("v", new, old, opts)
end
KeymapT = function(new, old)
    vim.keymap.set("t", new, old, opts)
end

vim.keymap.set("", "<Space>", "<Nop>", opts)        -- just in case
vim.g.mapleader = " "                               -- space is a good leader

-----------------
-- NORMAL MODE --
-----------------

-- Window Navigation
KeymapN("<C-h>", "<C-w>h")                          -- left
KeymapN("<C-j>", "<C-w>j")                          -- down
KeymapN("<C-k>", "<C-w>k")                          -- up
KeymapN("<C-l>", "<C-w>l")                          -- right

-- Buffer Navigation
KeymapN("<S-l>", ":bnext<CR>")
KeymapN("<S-h>", ":bprevious<CR>")
KeymapN("<S-q>", "<cmd>Bdelete!<CR>")

-- Window Resizing
KeymapN("<C-Up>", ":resize -2<CR>")
KeymapN("<C-Down>", ":resize +2<CR>")
KeymapN("<C-Left>", ":vertical resize -2<CR>")
KeymapN("<C-Right>", ":vertical resize +2<CR>")

-- give me a terminal
KeymapN("<leader>t", ":terminal<CR>")

-- Quick Save
KeymapN("<leader>s", "<cmd>w<CR>")
KeymapN("<leader>q", "<cmd>wq<CR>")
vim.cmd "autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif"

-----------------
-- VISUAL MODE --
-----------------

-- why would "<" exit visual mode?
KeymapV("<", "<gv")
KeymapV(">", ">gv")

-- when pasting overwrites your clipboard...
KeymapV("p", "P")

-----------------
-- INSERT MODE --
-----------------

-- esc is just so far away...
KeymapI("jk", "<ESC>")

-------------------
-- TERMINAL MODE --
-------------------

-- some of these maps are just crazy
KeymapT("jk", "<C-\\><C-N>")
