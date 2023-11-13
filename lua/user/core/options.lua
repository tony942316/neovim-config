-- Hint: use `:h <option>` to figure out the meaning if needed
vim.opt.clipboard = "unnamedplus"   -- use system clipboard
vim.opt.completeopt = { "menu", "menuone", "noselect" }
vim.opt.mouse = "a"                 -- allow mouse

-- Tab
vim.opt.tabstop = 4                 -- visual spaces per TAB
vim.opt.softtabstop = 4             -- actual spaces per TAB
vim.opt.shiftwidth = 4              -- insert spaces per TAB
vim.opt.expandtab = true            -- look data I'm a real Space
vim.opt.showtabline = 0             -- always show tabs
vim.opt.smartindent = true          -- ai block-chain powered indenting
vim.opt.list = true                 -- edit invisible chars
vim.opt.listchars:append "tab:\\t"  -- spot those pesky tabs

-- UI
vim.opt.number = true               -- turn on line numbers
vim.opt.relativenumber = true       -- make line numbers relative
vim.opt.cursorline = true           -- underline current line
vim.opt.splitbelow = true           -- always split below
vim.opt.splitright = true           -- always split right
vim.opt.showmode = false            -- I know when I'm in insert mode
vim.opt.pumheight = 10              -- height of pop up menu
vim.opt.termguicolors = true        -- pretty colors
vim.opt.laststatus = 3              -- only last window has a status line
vim.opt.showcmd = false             -- don't show chord echo on screen
vim.opt.wrap = false                -- word wrap is dumb
vim.opt.scrolloff = 8               -- keep 8 lines above and below the cusor
vim.opt.sidescrolloff = 8           -- same for horizontal
vim.opt.fillchars.eob = " "         -- ~ for end of buffer
vim.opt.ruler = false               -- lualine takes care of this
vim.opt.colorcolumn = "81"          -- horizontal scrolling is rude

-- Searching
vim.opt.incsearch = true            -- partial search while typing
vim.opt.hlsearch = false            -- just highlight the next one please
vim.opt.ignorecase = true           -- search shouldn't be case sensitive
vim.opt.smartcase = true            -- ... unless I want it to be

-- File
vim.opt.conceallevel = 0            -- make `` visible in markdown
vim.opt.fileencoding = "utf-8"      -- file encoding
vim.opt.swapfile = false            -- no need for this
vim.opt.backup = false              -- not this either
vim.opt.undofile = true             -- the real backup file
vim.opt.updatetime = 300            -- probably does something every 300ms
vim.opt.writebackup = false         -- one editor at a time please

-- Misc
vim.opt.timeout = true              -- turn on chord timeout
vim.opt.timeoutlen = 300            -- set chord timeout in ms
vim.cmd [[set iskeyword-=_]]        -- underscores shouldn't count for words
