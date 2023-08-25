if vim.api.nvim_eval("exists('g:GuiLoaded')") == 0 then
	require("catppuccin").setup({
		transparent_background = true,
		dim_inactive = {enabled = false}
	})
	vim.cmd [[hi Normal guibg=NONE]]
end

vim.cmd [[ colorscheme catppuccin ]]

