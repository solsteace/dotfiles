-- Automagically install lazy.nvim if not exist
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("sol.plugins")
--[[
{
	"dstein64/vim-startuptime",
	"andweeb/presence.nvim",
	{ "nvim-lualine/lualine.nvim",
		depedencies = { "folke/tokyonight.nvim" }
	},
	{"folke/tokyonight.nvim",
	  lazy = true,
	  priority = 1000,
	  opts = {},
	},
	{"catppuccin/nvim", 
		name = "catppuccin", 
		priority = 1000 
	},
	{ 'goolord/alpha-nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons' },
		config = function ()
			require'alpha'.setup(require'alpha.themes.startify'.config)
		end
	},
})]]--
