vim.pack.add({
    { src = "https://github.com/mfussenegger/nvim-dap-python" },
}, { confirm = false })

vim.defer_fn(function()
    local dap_python = require("dap-python")
    dap_python.setup("~/.virtualenvs/debugpy/bin/python")
    dap_python.test_runner = "pytest"
end, 500)
