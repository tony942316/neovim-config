return {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
        "rafamadriz/friendly-snippets"
    },
    config = function()
        local cmp = require("cmp")
        local luasnip = require("luasnip")

        require("luasnip.loaders.from_vscode").lazy_load()

        cmp.setup({
            completion = {
                completeopt = "menu,menuone,preview,noselect"
            },
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end
            },
            mapping = cmp.mapping.preset.insert({
                ["<A-k>"] = cmp.mapping.select_prev_item(),
                ["<A-j>"] = cmp.mapping.select_next_item(),
                ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                ["<C-f>"] = cmp.mapping.scroll_docs(4),
                ["<C-Space"] = cmp.mapping.complete(),
                ["<C-e>"] = cmp.mapping.abort(),
                ["<TAB>"] = cmp.mapping.confirm({ select = true })
            }),
            sources = cmp.config.sources({
                { name = "nvim_lsp" },
                { name = "luasnip" },
                { name = "buffer" },
                { name = "path" }
            }),
            experimental = {
                ghost_text = true
            }
        })
    end
}
