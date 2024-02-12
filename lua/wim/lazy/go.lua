--
-- Golang setup
--

-- auto format/import on save
local format_sync_grp = vim.api.nvim_create_augroup("GoFormat", {})
vim.api.nvim_create_autocmd("BufWritePre",  {
    pattern = "*.go",
    callback = function()
        require("go.format").goimport()
    end,
    group = format_sync_grp,
})

return {
    "ray-x/go.nvim",
    config = function()
        require("go").setup()
    end,
    event = {"CmdlineEnter"},
    ft = {"go", "gomod"},
    -- if you need to install/update all binaries
    build = ":lua require('go.install').update_all_sync()",
}
