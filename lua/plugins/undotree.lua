vim.pack.add({
    { src = "https://github.com/mbbill/undotree" },
}, { confirm = false })

vim.keymap.set("n", "<leader>U", vim.cmd.UndotreeToggle, { desc = "UndotreeToggle" })
