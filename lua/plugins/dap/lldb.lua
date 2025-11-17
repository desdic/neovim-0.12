local dap = require("dap")
local last_program = nil

dap.adapters.lldb = {
    type = "executable",
    command = "/sbin/codelldb",
    name = "lldb",
}

dap.configurations.cpp = {
    {
        name = "Debug with LLDB",
        type = "lldb",
        request = "launch",
        program = function()
            if last_program then
                return last_program
            end
            last_program = vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
            return last_program
        end,
        cwd = "${workspaceFolder}",
        stopOnEntry = false,
        args = {},
        runInTerminal = false,
    },
}

vim.api.nvim_create_user_command("DapResetBinary", function()
    last_program = nil
    print("DAP binary reset. Next debug session will ask for a path.")
end, {})

dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp
dap.configurations.zig = dap.configurations.cpp
