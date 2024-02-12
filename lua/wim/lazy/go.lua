--
-- Golang setup
--
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
