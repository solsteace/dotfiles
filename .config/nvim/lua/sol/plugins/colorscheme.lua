return { "catppuccin/nvim", 
	name = "catppuccin", 
	priority = 1000,
	config = function()
		if vim.api.nvim_eval("exists('g:GuiLoaded')") == 0 then
			require("catppuccin").setup({
				transparent_background = true,
				dim_inactive = {enabled = false}
			})
		end

		vim.cmd [[
			hi Normal guibg=NONE
			colorscheme catppuccin
		]]
	end,
}
