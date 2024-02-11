--
-- THEME
-- 
return {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
    config = function() 
        require("tokyonight").setup({
            -- The theme comse in multiple styles
            -- * storm
            -- * moon
            -- * night
            -- * day
            style = "storm",

            -- Enable this to disable setting the background color
            --transparant = true,

            -- Configure the colors used when opening a `:terminal` in Neovim
            terminal_colors = true,
            
            styles = {
                sidebars = "dark",
                floats = "dark",
            },
        })
        vim.cmd.colorscheme("tokyonight")

        -- Enable this to set transparant background
        --vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
        --vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    end,
}
