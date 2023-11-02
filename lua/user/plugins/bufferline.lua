return {
    "akinsho/bufferline.nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
        "famiu/bufdelete.nvim"
    },
    version = "*",
    opts = { -- Runs require(bufferline).setup(opts)
        options = {
            close_command = "Bdelete! %d",
            offsets = { { filetype = "NvimTree", Text = "", padding = 1 } },
            separator_style = "thin"
        }
    }
}
