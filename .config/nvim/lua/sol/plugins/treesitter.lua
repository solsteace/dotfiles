return {"nvim-treesitter/nvim-treesitter",
	event = {"BufReadPost", "BufNewFile"},
	build = ":TSUpdate",
	dependencies = { "nvim-treesitter/nvim-treesitter-textobjects"},
	cmd = {"TSUpdateSync"},
	config = function()
		require('nvim-treesitter.configs').setup({
			ensure_installed = {
				"go", "python", "cpp", "html", "css", 
				"javascript", "lua", "markdown",
			},
			highlight = { enable = true },
			indent = { enable = true },
		})
	end
}
