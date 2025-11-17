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

local opts = {
    modes = { insert = true, command = false, terminal = false },

    mappings = {
        [")"] = { action = "close", pair = "()", neigh_pattern = "[^\\]." },
        ["]"] = { action = "close", pair = "[]", neigh_pattern = "[^\\]." },
        ["}"] = { action = "close", pair = "{}", neigh_pattern = "[^\\]." },
        ["["] = {
            action = "open",
            pair = "[]",
            neigh_pattern = ".[%s%z%)}%]]",
            register = { cr = false },
            -- foo|bar -> press "[" -> foo[bar
            -- foobar| -> press "[" -> foobar[]
            -- |foobar -> press "[" -> [foobar
            -- | foobar -> press "[" -> [] foobar
            -- foobar | -> press "[" -> foobar []
            -- {|} -> press "[" -> {[]}
            -- (|) -> press "[" -> ([])
            -- [|] -> press "[" -> [[]]
        },
        ["{"] = {
            action = "open",
            pair = "{}",
            -- neigh_pattern = ".[%s%z%)}]",
            neigh_pattern = ".[%s%z%)}%]]",
            register = { cr = false },
            -- foo|bar -> press "{" -> foo{bar
            -- foobar| -> press "{" -> foobar{}
            -- |foobar -> press "{" -> {foobar
            -- | foobar -> press "{" -> {} foobar
            -- foobar | -> press "{" -> foobar {}
            -- (|) -> press "{" -> ({})
            -- {|} -> press "{" -> {{}}
        },
        ["("] = {
            action = "open",
            pair = "()",
            -- neigh_pattern = ".[%s%z]",
            neigh_pattern = ".[%s%z%)]",
            register = { cr = false },
            -- foo|bar -> press "(" -> foo(bar
            -- foobar| -> press "(" -> foobar()
            -- |foobar -> press "(" -> (foobar
            -- | foobar -> press "(" -> () foobar
            -- foobar | -> press "(" -> foobar ()
        },
        -- Single quote: Prevent pairing if either side is a letter
        ['"'] = {
            action = "closeopen",
            pair = '""',
            neigh_pattern = "[^%w\\][^%w]",
            register = { cr = false },
        },
        -- Single quote: Prevent pairing if either side is a letter
        ["'"] = {
            action = "closeopen",
            pair = "''",
            neigh_pattern = "[^%w\\][^%w]",
            register = { cr = false },
        },
        -- Backtick: Prevent pairing if either side is a letter
        ["`"] = {
            action = "closeopen",
            pair = "``",
            neigh_pattern = "[^%w\\][^%w]",
            register = { cr = false },
        },
    },
    -- -- skip autopair when next character is one of these
    skip_next = [=[[%w%%%'%[%"%.%`%$]]=],
    -- -- skip autopair when the cursor is inside these treesitter nodes
    skip_ts = { "string" },
    -- -- skip autopair when next character is closing pair
    -- -- and there are more closing pairs than opening pairs
    skip_unbalanced = true,
    -- -- better deal with markdown code blocks
    markdown = true,
}

require("core.utils").mini_pair_setup(opts)

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
