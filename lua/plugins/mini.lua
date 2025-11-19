require("mini.tabline").setup({
    format = function(buf_id, label)
        local suffix = vim.bo[buf_id].modified and "+" or ""
        return require("mini.tabline").default_format(buf_id, label) .. suffix
    end,
    tabpage_section = "right",
})

require("mini.ai").setup({
    mappings = {
        -- Disable next/last variants.
        around_next = "",
        inside_next = "",
        around_last = "",
        inside_last = "",
    },
})

require("mini.surround").setup({
    mappings = {
        add = "gsa", -- Add surrounding in Normal and Visual modes
        delete = "gsd", -- Delete surrounding
        find = "gsf", -- Find surrounding (to the right)
        find_left = "gsF", -- Find surrounding (to the left)
        highlight = "gsh", -- Highlight surrounding
        replace = "gsr", -- Replace surrounding
        update_n_lines = "gsn", -- Update `n_lines`
    },
})
