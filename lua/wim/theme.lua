function SetTheme()
	vim.cmd.colorscheme("rose-pine")
	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
end

SetTheme()
