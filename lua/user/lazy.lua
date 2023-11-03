-- Bootstrap Lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath
    })
end
vim.opt.rtp:prepend(lazypath)

KeymapN("<leader>l", ":Lazy<CR>")

require("lazy").setup({
    { import = "user.plugins" },
    { import = "user.plugins.lsp" }
},
{
    install = {
        colorscheme = { "tokyonight-night" }
    },
    checker = {
        enabled = true,
        notify = false
    },
    change_detection = {
        notify = false
    }
})
