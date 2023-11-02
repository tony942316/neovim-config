return {
    "numToStr/Comment.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = true -- Runs Default require("Comment").setup()
}
