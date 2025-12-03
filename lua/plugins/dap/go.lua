vim.pack.add({
    { src = "https://github.com/leoluz/nvim-dap-go" },
}, { confirm = false })

vim.defer_fn(function()
    require("dap-go").setup()
end, 500)
