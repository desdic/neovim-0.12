vim.pack.add({
    { src = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects", version = "main" },
}, { confirm = false })

vim.defer_fn(function()
    require("nvim-treesitter-textobjects").setup({
        select = {
            enable = true,
            -- Automatically jump forward to textobj, similar to targets.vim
            lookahead = true,
            -- You can choose the select mode (default is charwise 'v')

            selection_modes = {
                ["@parameter.outer"] = "v", -- charwise
                ["@function.outer"] = "V", -- linewise
                ["@class.outer"] = "<c-v>", -- blockwise
            },
            include_surrounding_whitespace = false,
        },
        move = {
            -- whether to set jumps in the jumplist
            set_jumps = true,
        },
    })

    vim.g.no_plugin_maps = true

    local select = require("nvim-treesitter-textobjects.select")
    vim.keymap.set({ "x", "o" }, "af", function()
        select.select_textobject("@function.outer", "textobjects")
    end)
    vim.keymap.set({ "x", "o" }, "if", function()
        select.select_textobject("@function.inner", "textobjects")
    end)
    --
    -- -- You can also use captures from other query groups like `locals.scm`
    vim.keymap.set({ "x", "o" }, "as", function()
        select.select_textobject("@local.scope", "locals")
    end)

    local ts_repeat_move = require("nvim-treesitter-textobjects.repeatable_move")
    vim.keymap.set({ "n", "x", "o" }, "f", ts_repeat_move.builtin_f_expr, { expr = true })
    vim.keymap.set({ "n", "x", "o" }, "F", ts_repeat_move.builtin_F_expr, { expr = true })
    vim.keymap.set({ "n", "x", "o" }, "t", ts_repeat_move.builtin_t_expr, { expr = true })
    vim.keymap.set({ "n", "x", "o" }, "T", ts_repeat_move.builtin_T_expr, { expr = true })
end, 30)
