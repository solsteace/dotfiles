local config = require("nvim-treesitter.configs")

-- Check here :h nvim-treesitter-quickstart
config.setup{
	-- add more as you need
	ensure_installed = {"go", "python", "cpp", "html", "css", "javascript", "lua", "markdown"},
}
