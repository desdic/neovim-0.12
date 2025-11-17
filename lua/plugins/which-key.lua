require("which-key").setup({
    plugins = {
        marks = false,
        registers = false,
    },
    delay = 1000,
})

vim.keymap.set("n", "<leader>?", function()
    require("which-key").show({ global = false })
end, { desc = "Buffer Local Keymaps (which-key)" })
