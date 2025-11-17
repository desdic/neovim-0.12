require("oil").setup({
    default_file_explorer = false, -- we need netrw to download spellings
    view_options = {
        show_hidden = true,
    },
})

vim.keymap.set("n", "<leader>ne", ":Oil<CR>", { desc = "Oil" })
