local config = require("nvim-treesitter.configs")

config.setup{
	-- Check here :h nvim-treesitter-quickstart
	-- add more as you need
	ensure_installed = {"go", "python", "cpp", "html", "css", "javascript"},
	highlight = {
		enable = true,
		-- 'false' to gnore nvim's regex highlight
		additional_vim_regex_highlighting = false,
	},
}
