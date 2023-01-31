return require("packer").startup(
	function(use)
		-- Essential
		use "wbthomason/packer.nvim"
	
		use {"nvim-treesitter/nvim-treesitter", 
			run = function()
				require('nvim-treesitter.install').update{ with_sync = true}
			end,
		}
		
		-- Language Server Protocol
		use {"neovim/nvim-lspconfig"}
		use {"RishabhRD/nvim-lsputils"}
		use {"williamboman/mason.nvim"} -- Install some LSP easier

		-- Interface sugar
		use {"goolord/alpha-nvim"}
		use {"nvim-lualine/lualine.nvim"}
		use {"nvim-tree/nvim-web-devicons"}
		
		-- Syntatic Sugar
		use {"catppuccin/nvim", as = "catppuccin"}

	end
)
