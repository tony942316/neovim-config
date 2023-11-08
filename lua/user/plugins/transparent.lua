return {
    "xiyaowong/transparent.nvim",
    lazy = false,
    config = function()
        require("transparent").setup({
                require("transparent").setup({
        groups = {
            'Normal', 'NormalNC', 'Comment', 'Constant', 'Special', 'Identifier',
            'Statement', 'PreProc', 'Type', 'Underlined', 'Todo', 'String', 'Function',
            'Conditional', 'Repeat', 'Operator', 'Structure', 'LineNr', 'NonText',
            'SignColumn', 'CursorLineNr', 'EndOfBuffer'
        },
        extra_groups = { "NormalFloat", "NvimTreeNormal" },
        exclude_groups = {}
    })
        })
    end
}
