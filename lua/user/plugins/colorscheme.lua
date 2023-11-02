return {
    {
        "folke/tokyonight.nvim",
        priority = 1000,
        config = function()
            vim.cmd([[colorscheme tokyonight-night]])
        end
    },
    {
        "bluz71/vim-nightfly-guicolors",
        priority = 1001,
        config = function()
            vim.cmd([[colorscheme nightfly]])
        end
    },
    {
        "rose-pine/neovim",
        priority = 1001,
        config = function()
            vim.cmd([[colorscheme rose-pine]])
        end
    }
}
