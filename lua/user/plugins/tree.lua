return {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
        "nvim-tree/nvim-web-devicons"
    },
    config = function()
        local nvimtree = require("nvim-tree")

        -- Disable netrw
        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1

        -- Set Color Of Arrows To Light Blue
        vim.cmd([[ highlight NvimTreeIndentMarker guifg=#3FC5FF ]])

        local function my_on_attach(bufnr)
            local api = require("nvim-tree.api")
            local function opts(desc)
                return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
            end

            api.config.mappings.default_on_attach(bufnr)

            vim.keymap.del("n", "<S-l>", { buffer = bufnr })
            vim.keymap.set("n", "<S-l>", "<cmd>wincmd l<CR>", opts("Return"))

            vim.keymap.set("n", "?", api.tree.toggle_help, opts("Help"))
        end

        nvimtree.setup({
            on_attach = my_on_attach,
            view = { width = 40 },
            git = { ignore = false },
            renderer = {
                icons = {
                    glyphs = {
                        default = "",
                        symlink = "",
                        folder = {
                            arrow_open = "",
                            arrow_closed = "",
                            default = "",
                            open = "",
                            empty = "",
                            empty_open = "",
                            symlink = "",
                            symlink_open = ""
                        },
                        git = {
                            unstaged = "",
                            staged = "S",
                            unmerged = "",
                            renamed = "➜",
                            untracked = "U",
                            deleted = "",
                            ignored = "◌"
                        }
                    }
                }
            },
            diagnostics = {
                enable = true,
                show_on_dirs = true,
                icons = {
                    hint = "󰌵",
                    info = "",
                    warning = "",
                    error = ""
                }
            },
        })

        KeymapN("<leader>e", "<cmd>NvimTreeToggle<CR>")
        KeymapN("<S-e>", "<cmd>NvimTreeFocus<CR>")
    end
}
