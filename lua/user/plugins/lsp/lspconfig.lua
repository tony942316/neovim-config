return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "hrsh7th/cmp-nvim-lsp"
    },
    config = function()
        local lspconfig = require("lspconfig")

        local cmp_nvim_lsp = require("cmp_nvim_lsp")

        local opts = { noremap = true, silent = true }
        local on_attach = function(_, bufnr)
            opts.buffer = bufnr

            opts.desc = "Show line diagnostics"
            vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)

            opts.desc = "Show documentation for what is under the cursor"
            vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)

            opts.desc = "Restart LSP"
            vim.keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts)

            opts.desc = "Goto Declaration"
            vim.keymap.set("n", "<leader>gD", vim.lsp.buf.declaration, opts)

            opts.desc = "Goto Definition"
            vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, opts)
        end

        local capabilities = cmp_nvim_lsp.default_capabilities()

        lspconfig["clangd"].setup({
            capabilities = capabilities,
            on_attach = on_attach
        })

        lspconfig["cmake"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
            settings = {
                CMake = {
                    filetypes = { "cmake", "CMakeLists.txt" }
                }
            }
        })

        lspconfig["bashls"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
            root_dir = function(_)
                return vim.loop.cwd()
            end
        })

        lspconfig["lua_ls"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
            settings = {
                Lua = {
                    diagnostics = {
                        globals = { "vim" }
                    },
                    workspace = {
                        library = {
                            [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                            [vim.fn.stdpath("config") .. "/lua"] = true
                        }
                    }
                }
            }
        })
    end
}
