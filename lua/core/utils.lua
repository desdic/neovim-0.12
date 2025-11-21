local M = {}

-- Check if plugin is loaded
M.has_plugin = function(plugin)
    return pcall(require, plugin)
end

M.pack_clean = function()
    local unused_plugins = {}

    for _, plugin in ipairs(vim.pack.get()) do
        if plugin.active ~= true then
            table.insert(unused_plugins, plugin.spec.name)
        end
    end

    if #unused_plugins == 0 then
        vim.print("No unused plugins")
        return
    end

    local choice = vim.fn.confirm("Remove unused plugins?", "&Yes\n&No", 2)
    if choice == 1 then
        vim.pack.del(unused_plugins)
    end
end

return M
