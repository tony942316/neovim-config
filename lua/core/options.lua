-- Hint: use `:h <option>` to figure out the meaning if needed

vim.opt.clipboard = "unnamedplus"
vim.opt.completeopt = { "menu", "menuone", "noselect" }
vim.opt.mouse = "a"

-- Tabs
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.showtabline = 0
vim.opt.smartindent = true
vim.opt.list = true
vim.opt.listchars:append "tab:\\t"

-- UI
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.showmode = false
vim.opt.pumheight = 10
vim.opt.termguicolors = true
vim.opt.laststatus = 3
vim.opt.showcmd = false
vim.opt.wrap = false
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
vim.opt.fillchars.eob = " "
vim.opt.ruler = false
vim.opt.colorcolumn = "81"

-- Misc
vim.opt.timeout = true
vim.opt.timeoutlen = 300
vim.cmd [[set iskeyword-=_]]
