-- 
-- LSP client
--
return {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v3.x",
    dependencies = {
        {"williamboman/mason.nvim"},
        {"williamboman/mason-lspconfig.nvim"},
        {
            "neovim/nvim-lspconfig",
            dependencies = {
                {"hrsh7th/cmp-nvim-lsp"},
            }
        },
        {
            "hrsh7th/nvim-cmp",
            dependencies = {
                {"L3MON4D3/LuaSnip"}
            },
        },
    },
    config = function()
        local lsp_zero = require("lsp-zero")
        lsp_zero.on_attach(function(_, bufnr) 
            -- see :help lsp-zero-keybindings to learn the available actions
            lsp_zero.default_keymaps({buffer = bufnr})
        end)

        require("mason").setup({})
        require("mason-lspconfig").setup({
            handlers = {
                lsp_zero.default_setup,
            },
        })
    end,
}
