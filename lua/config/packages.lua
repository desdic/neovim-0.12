vim.pack.add({
    -- Dependencies
    { src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "master" },
    { src = "https://github.com/nvim-tree/nvim-web-devicons" },
    { src = "https://github.com/nvim-lua/plenary.nvim" },

    -- Plugins
    { src = "https://github.com/catppuccin/nvim" },
    { src = "https://github.com/L3MON4D3/LuaSnip", version = vim.version.range("v2.*") },
    { src = "https://github.com/folke/lazydev.nvim" },
    { src = "https://github.com/Saghen/blink.cmp", version = vim.version.range("v1.*") },
    { src = "https://github.com/Saghen/blink.indent", version = vim.version.range("v2.*") },
    { src = "https://github.com/folke/snacks.nvim" },
    { src = "https://github.com/folke/which-key.nvim" },
    { src = "https://github.com/dimtion/guttermarks.nvim" },
    { src = "https://github.com/nvim-mini/mini.tabline" },
    { src = "https://github.com/nvim-mini/mini.ai" },
    { src = "https://github.com/nvim-mini/mini.pairs" },
    { src = "https://github.com/nvim-mini/mini.surround" },
    { src = "https://github.com/stevearc/oil.nvim" },
    { src = "https://github.com/stevearc/conform.nvim" },
    { src = "https://github.com/stevearc/quicker.nvim" },
    { src = "https://github.com/christoomey/vim-tmux-navigator" },
    { src = "https://github.com/ray-x/go.nvim" },
    { src = "https://github.com/nvim-lualine/lualine.nvim" },
    { src = "https://github.com/ruifm/gitlinker.nvim" },
    { src = "https://github.com/iamcco/markdown-preview.nvim" },
    { src = "https://github.com/mistweaverco/kulala.nvim" },
    { src = "https://github.com/mfussenegger/nvim-lint" },
    { src = "https://github.com/mrcjkb/rustaceanvim", version = vim.version.range("v6.*") },

    -- Own
    { src = "https://github.com/desdic/greyjoy.nvim" },
    { src = "https://github.com/desdic/marlin.nvim" },
    { src = "https://github.com/desdic/macrothis.nvim" },

    -- DAP
    { src = "https://github.com/nvim-neotest/nvim-nio" },
    { src = "https://github.com/julianolf/nvim-dap-lldb" },
    { src = "https://github.com/mfussenegger/nvim-dap-python" },
    { src = "https://github.com/leoluz/nvim-dap-go" },
    { src = "https://github.com/rcarriga/nvim-dap-ui" },
    { src = "https://github.com/mfussenegger/nvim-dap" },
})

-- -- local local_plugin_path = "~/src/private/greyjoy.nvim"
-- -- local local_plugin_path = "~/src/private/marlin.nvim"
-- -- local local_plugin_path = "~/src/private/macrothis.nvim"
-- -- vim.o.rtp = vim.o.rtp .. "," .. local_plugin_path
