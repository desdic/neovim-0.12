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
require("plugins.dap.dap")
