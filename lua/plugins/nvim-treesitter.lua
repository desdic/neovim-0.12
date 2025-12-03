vim.pack.add({
    { src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "master" },
}, { confirm = false })

vim.defer_fn(function()
    require("nvim-treesitter.configs").setup({
        ensure_installed = {
            "bash",
            "c",
            "comment",
            "cpp",
            "dockerfile",
            "glsl",
            "go",
            "gomod",
            "gosum",
            "gotmpl",
            "gowork",
            "http",
            "json",
            "json5",
            "jsonc",
            "lua",
            "make",
            "markdown",
            "markdown_inline",
            "meson",
            "mermaid",
            "perl",
            "php",
            "python",
            "query",
            "regex",
            "ruby",
            "rust",
            "sql",
            "toml",
            "vim",
            "vimdoc",
            "yaml",
            "zig",
        },
        indent = { enable = true, disable = {} },
        highlight = {
            enable = true, -- false will disable the whole extension
            disable = function(lang, bufnr)
                return lang == "yaml" and vim.api.nvim_buf_line_count(bufnr) > 5000
            end,
            additional_vim_regex_highlighting = false,
        },
    })

    vim.api.nvim_create_autocmd({ "PackChanged" }, {
        group = vim.api.nvim_create_augroup("TreesitterUpdated", { clear = true }),
        callback = function(args)
            local spec = args.data.spec
            if spec and spec.name == "nvim-treesitter" and args.data.kind == "update" then
                vim.notify("nvim-treesitter was updated, running :TSUpdate", vim.log.levels.INFO)
                vim.schedule_wrap(function()
                    vim.cmd("silent! TSUpdate")
                end)
            end
        end,
    })
end, 10)
