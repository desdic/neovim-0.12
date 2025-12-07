vim.pack.add({
    { src = "https://github.com/nvim-mini/mini.tabline" },
    { src = "https://github.com/nvim-mini/mini.ai" },
    { src = "https://github.com/nvim-mini/mini.surround" },
}, { confirm = false })

require("mini.tabline").setup({
    format = function(buf_id, label)
        local suffix = vim.bo[buf_id].modified and "+" or ""
        return require("mini.tabline").default_format(buf_id, label) .. suffix
    end,
    tabpage_section = "right",
})

vim.defer_fn(function()
    require("mini.ai").setup({
        mappings = {
            -- Disable next/last variants.
            around_next = "",
            inside_next = "",
            around_last = "",
            inside_last = "",
        },
    })
end, 300)
