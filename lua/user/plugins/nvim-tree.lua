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
            git = { ignore = false }
        })

        keymapN("<leader>e", "<cmd>NvimTreeToggle<CR>")

        vim.api.nvim_create_user_command("EQXBufN",
            function()
                if vim.bo.filetype == "NvimTree" then
                    vim.cmd("wincmd l")
                else
                    vim.cmd("bnext")
                end
            end, {})
        -- No Idea Why This Doesn't Work
        vim.api.nvim_create_user_command("EQXBufP",
            function()
                if vim.bo.filetype == "NvimTree" then
                    vim.cmd("wincmd l")
                else
                    vim.cmd("bprevious")
                end
            end, {})
        keymapN("<S-l>", ":EQXBufN<CR>")
        keymapN("<S-h>", ":EQXBufP<CR>")

        -- Other Cmds See Functionality On Github
        --vim.keymap.set("n", "<leader>ef", "<cmd>NvimTreeFindFileToggle<CR>")
        --vim.keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>")
        --vim.keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>")
    end
}
