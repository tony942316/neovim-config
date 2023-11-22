return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        require("nvim-treesitter.configs").setup({
            highlight = {
                enable = true
            },
            -- indent = { enable = true },
            ensure_installed = {
                "json",
                "javascript",
                "typescript",
                "yaml",
                "html",
                "css",
                "markdown",
                "markdown_inline",
                "bash",
                "lua",
                "vim",
                "gitignore",
                "c",
                "cmake",
                "cpp",
                "glsl",
                "make",
                "ninja",
                "python",
                "rust",
                "toml"
            }
        })
    end,
}
