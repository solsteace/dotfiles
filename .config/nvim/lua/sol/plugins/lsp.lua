return {"neovim/nvim-lspconfig",
	event = {"BufFilePost", "BufFilePre"},
	config = function()
		-- STYLE ============================================
		local bufopts = {silent = true, noremap = true, buffer = bufnr }
		local opts = {silent = true, noremap = true}
		local signs = {Error = "X ", Warn = "! ", Hint = "? ", Info = "i "}
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, {text = icon, texthl = hl, numhl = hl})
		end

		local border = {
			  {"╭", "FloatBorder"}, -- Top Left
			  {"─", "FloatBorder"}, -- Top
			  {"╮", "FloatBorder"}, -- Top Right
			  {"│", "FloatBorder"}, -- Right
			  {"╯", "FloatBorder"}, -- Bottom Right
			  {"─", "FloatBorder"}, -- Bottom
			  {"╰", "FloatBorder"}, -- Bottom Left
			  {"│", "FloatBorder"}, -- Left
		}

		local handlers = {
			["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {border = border}),
			["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {border = border}),
		}

		vim.diagnostic.config({
			virtual_text = false,
			underline = true,
		})

		--[[ REMAPS ====================================
		  Note: For leader key, check 'basic' file ]]--
			--vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
		-- View diagnostic details
			vim.keymap.set('n', ',,', vim.diagnostic.open_float, opts)
		-- Jump to next and previous diagnostic
			vim.keymap.set('n', ',dh', vim.diagnostic.goto_next, opts)
			vim.keymap.set('n', ',dl', vim.diagnostic.goto_prev, opts)
		-- View diagnostic details
			vim.keymap.set('n', ',dd', vim.diagnostic.show, opts)

		-- Jump to where something is defined (explain about something that exist)
			vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts) 
		-- Jump to where something is declared (tells existence of something)
			vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
		-- Describe something under cursor [Do twice to go to floating window]
			vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
		-- Rename all occurence of something under cursor
			vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
		-- Code action (brief details soon)
			vim.keymap.set('n', 'ca', vim.lsp.buf.code_action, bufopts)

		-- START =========================================
		local lspcon = require("lspconfig")
		local default_config_servers = {
			"gopls", -- Go
			"pyright", -- Python
			"clangd", -- CPP
			"html",
			"emmet_ls", -- Emmet
			"cssls",  -- CSS
			"tsserver",
		}

		-- Needed by cmp (?)
		local capabilities = require('cmp_nvim_lsp').default_capabilities()
		capabilities.textDocument.completion.completionItem.snippetSupport = true
		for _, server in ipairs(default_config_servers) do
			lspcon[server].setup {
				handlers = handlers,
				capabilities = capabilities
			}
		end

		lspcon.eslint.setup({
		  on_attach = function(client, bufnr)
			vim.api.nvim_create_autocmd("BufWritePre", { -- Enable fix by esLint
			  buffer = bufnr,
			  command = "EslintFixAll",
			})
		  end,
		})
	end
}
