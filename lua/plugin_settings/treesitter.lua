local config = require("nvim-treesitter.configs")

config.setup{
	-- Check here :h nvim-treesitter-quickstart
	ensure_installed = {"go", "lua", "python", "rust"},
	highlight = {
		enable = true,
		-- 'false' to gnore nvim's regex highlight
		additional_vim_regex_highlighting = false,
	},
}
