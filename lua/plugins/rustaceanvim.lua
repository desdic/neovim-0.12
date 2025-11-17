vim.g.rustaceanvim = {
    tools = {},
    server = {
        on_attach = function(client, bufnr)
            -- TODO: you can also put keymaps in here
        end,
        default_settings = {
            ["rust-analyzer"] = {},
        },
    },
    -- DAP configuration
    dap = {},
}
