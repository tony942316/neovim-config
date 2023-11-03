return {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        "nvim-tree/nvim-web-devicons"
    },
    config = function()
        local telescope = require("telescope")
        local actions = require("telescope.actions")

        telescope.load_extension("fzf");

        vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>")
        vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<CR>")
    end
}
