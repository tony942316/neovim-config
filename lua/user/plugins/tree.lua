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

        nvimtree.setup({
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

        vim.api.nvim_create_user_command("EQXBufN",
            function()
                if vim.bo.filetype == "NvimTree" then
                    vim.cmd("wincmd l")
                else
                    vim.cmd("bnext")
                end
            end, {})
        KeymapN("<S-l>", ":EQXBufN<CR>")

        -- Other Cmds See Functionality On Github
        --vim.keymap.set("n", "<leader>ef", "<cmd>NvimTreeFindFileToggle<CR>")
        --vim.keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>")
        --vim.keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>")
    end
}
