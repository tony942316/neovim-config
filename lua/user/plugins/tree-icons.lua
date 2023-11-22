return {
    "nvim-tree/nvim-web-devicons",
    event = "VeryLazy",
    config = function()
        require("nvim-web-devicons").setup {
            override = {
                ipp = {
                    icon = "󰍛",
                    color = "#eb741e",
                    cterm_color = "28",
                    name = "CppImplementation"
                }
            },
            color_icons = true,
            default = true
        }
    end
}
