vim.pack.add({
    { src = "https://github.com/nvim-neotest/nvim-nio" },
    { src = "https://github.com/rcarriga/nvim-dap-ui" },
    { src = "https://github.com/mfussenegger/nvim-dap" },
}, { confirm = false })

vim.keymap.set("n", "<leader>db", function()
    require("dap").toggle_breakpoint()
end, { desc = "DAP Set/Toggle breakpoint" })
vim.keymap.set("n", "<leader>dB", function()
    require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
end, { desc = "DAP Set breakpoint" })
vim.keymap.set("n", "<leader>dc", function()
    require("dap").continue()
end, { desc = "Start/Continue" })
vim.keymap.set("n", "<leader>dl", function()
    require("dap").run_last()
end, { desc = "Run last" })
vim.keymap.set("n", "<leader>do", function()
    require("dap").step_over()
end, { desc = "DAP Step over" })
vim.keymap.set("n", "<leader>di", function()
    require("dap").step_into()
end, { desc = "DAP Step into" })
vim.keymap.set("n", "<leader>dO", function()
    require("dap").step_out()
end, { desc = "DAP Step out" })
vim.keymap.set("n", "<leader>dr", function()
    require("dap").clear_breakpoints()
end, { desc = "DAP Clear all breakpoints" })

local sign = vim.fn.sign_define

vim.api.nvim_set_hl(0, "DapStoppedLine", { default = true, link = "Visual" })

sign("DapBreakpoint", { text = " ", texthl = "", linehl = "", numhl = "" })
sign("DapBreakpointCondition", { text = " ", texthl = "", linehl = "", numhl = "" })
sign("DapLogPoint", { text = "◆", texthl = "DapLogPoint", linehl = "", numhl = "" })
sign("DapStopped", { text = "󰁕", texthl = "DiagnosticWarn", linehl = "DapStoppedLine", numhl = "" })
sign("DapBreakpointRejected", { text = " ", texthl = "DiagnosticError", linehl = "", numhl = "" })

require("plugins.dap.go")
require("plugins.dap.python")
require("plugins.dap.lldb")
require("plugins.dap.ui")
