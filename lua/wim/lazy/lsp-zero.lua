-- 
-- LSP client
--

local function setup_lspconifg()
    local lspconfig = require("lspconfig")
    lspconfig.lua_ls.setup{
        settings = {
            Lua = {
                diagnostics = {
                    globals = {"vim"},
                },
            },
        },
    }
end

local function setup_mason(lsp_zero)
    require("mason").setup({})
    require("mason-lspconfig").setup({
        handlers = {
            lsp_zero.default_setup,
        },
    })
end

local function setup_cmp()
    local cmp = require("cmp")
    cmp.setup({
        mapping = {
            ["<Tab>"] = cmp.mapping(function(fallback)
                if not cmp.visible() then
                    fallback()
                elseif #cmp.get_entries() == 1 then
                    cmp.confirm({ select = true })
                elseif not cmp.get_selected_entry() then
                    cmp.select_next_item({
                        behaviour = cmp.SelectBehavior.Select,
                        select = true
                    })
                else
                    fallback()
                end
            end, {"i", "s", "c"}),
        }
    })
end

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

        setup_lspconifg()
        setup_mason(lsp_zero)
        setup_cmp()
    end,
}
