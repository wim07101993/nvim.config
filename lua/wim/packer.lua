vim.cmd [[packadd packer.nvim]]

return require("packer").startup(function(use)
    -- must be here, otherwise packer will be removed...
	use "wbthomason/packer.nvim"

    -- theming
	use "rose-pine/neovim"

    use {
        "nvim-treesitter/nvim-treesitter", 
        { run = ":TSUpdate" }
    }

    -- fuzzy finding
    use {
        "nvim-telescope/telescope.nvim", 
        tag = "0.1.5",
        requires = {{ "nvim-lua/plenary.nvim"}}
    }

    -- git
    use "tpope/vim-fugitive"
end)
