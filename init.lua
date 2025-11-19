require("config.packages")
require("config.options")
require("config.keymaps")
require("config.lsp")
require("config.autocmds")

-- Load plugins
local plugins = vim.api.nvim_get_runtime_file("lua/plugins/*.lua", true)
table.sort(plugins)
for _, v in ipairs(plugins) do
    local name = vim.fn.fnamemodify(v, ":t:r")
    require("plugins." .. name)
end
