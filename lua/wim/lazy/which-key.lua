--
-- SOME HELP TO REMEMBER WHICH KEY-BINDINGS DO WHAT
--
return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function() 
        vim.o.timeout = true
        vim.o.timeoutlen = 300
    end,
    opts = {
    },
    config = function() 
        local wk = require("which-key")
        wk.register({
            f = {
                name = "Find",
                b = { "<cmd>Telescope buffers<cr>", "Find buffer" },
                f = { "<cmd>Telescope find_files<cr>", "Find file" },
                g = { "<cmd>Telescope live_grep<cr>", "Find with grep" },
                p = { "<cmd>Telescope git_files<cr>", "Find Project file (git)" }, 
            }
        }, { prefix = "<leader>" })
        
    end,
}
