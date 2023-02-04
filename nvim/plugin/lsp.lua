local bufopts = {silent = true, noremap = true, buffer = bufnr }
local opts = {silent = true, noremap = true}
vim.lsp.set_log_level("debug")

-- Nvim LSP installer thing
require("mason").setup{}

--[[ REMAPS ====================================
  Note : For leader key, check 'basic' file ]]--
-- View diagnostic details
	vim.keymap.set('n', ',,', vim.diagnostic.open_float, opts)
-- Jump to next and previous diagnostic
	vim.keymap.set('n', ',.', vim.diagnostic.goto_next, opts)
	vim.keymap.set('n', ',m', vim.diagnostic.goto_prev, opts)

local on_attach = function(client, bufnr)
	vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

	-- Jump to where something is declared
		vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts) 
	-- Jump to where something is defined
		vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
	-- Describe something under cursor [Do twice to go to floating window]
		vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
	-- Rename all occurence of something under cursor
		vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
	-- Code action (brief details soon)
		vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
end

-- styles ============================================
local signs = {Error = "X ", Warn = "! ", Hint = "? ", Info = "i "}
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, {text = icon, texthl = hl, numhl = hl})
end

local border = {
      {"┌", "FloatBorder"}, -- Top Left
      {"┄", "FloatBorder"}, -- Top
      {"┐", "FloatBorder"}, -- Top Right
      {"┊", "FloatBorder"}, -- Right
      {"┘", "FloatBorder"}, -- Bottom Right
      {"┄", "FloatBorder"}, -- Bottom
      {"└", "FloatBorder"}, -- Bottom Left
      {"┊", "FloatBorder"}, -- Left
}

local handlers = {
	["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {border = border}),
	["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {border = border}),
}

vim.diagnostic.config({
	virtual_text = false,
})

--[[ START =========================================
   Add more in 'servers' table based on what language you usually work with]]--
local servers = {"gopls", "sumneko_lua", "pyright", "clangd"}
local settings = {
	["gopls"] = {},
	["sumneko_lua"] = {},
	["pyright"] = {},
	["clangd"] = {},
}

for _, server in ipairs(servers) do
	require('lspconfig')[server].setup{
		on_attach = on_attach,
		handlers = handlers,
		-- settings = settings[server],
	}
end

--[[ Self note ====================================
=] Lua - sumneko_lua [Install via lsp_installer].
	Add lua_language_server bin folder to PATH (Windows)
   
=] Go - gopls [Install via cmd: ]

=] Python - pyright [Install via pip: pip install pyright]

=] C++ - clangd [Install via lsp_installer]
	Add clangd bin folder to PATH (windows)
]]--

