vim.api.nvim_create_user_command("EQXBufType",
    function()
        print(vim.bo.filetype)
    end, {})
