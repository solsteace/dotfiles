return {"nvim-treesitter/nvim-treesitter",
	build = function()
        require("nvim-treesitter.install").update({ with_sync = true })
	end,
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = {
				"go", "python", "cpp", "html", "css", 
				"javascript", "lua", "markdown",
			}
		})
		require("nvim-treesitter.install").update({ with_sync = true })
	end
}
