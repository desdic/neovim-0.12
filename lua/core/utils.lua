local M = {}

-- Check if plugin is loaded
M.has_plugin = function(plugin)
    return pcall(require, plugin)
end

M.is_top_empty_file = function()
    local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
    local _, col = vim.api.nvim_win_get_cursor(0)
    if #lines <= 1 and col == 2 then
        return true
    end
    return false
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
