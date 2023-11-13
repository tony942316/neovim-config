return {
    "williamboman/mason.nvim",
    dependencies = {
        "williamboman/mason-lspconfig.nvim"
    },
    config = function()
        local mason = require("mason")

        mason.setup({
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗"
                }
            }
        })

        local mason_lspconfig = require("mason-lspconfig")

        mason_lspconfig.setup({
            ensure_installed = {
                "clangd",
                "lua_ls",
                "cmake",
                "bashls"
            },

            automatic_installation = true
        })


        KeymapN("<leader>m", "<cmd>Mason<CR>")
    end
}
