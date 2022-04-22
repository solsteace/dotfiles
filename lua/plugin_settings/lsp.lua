local lsp_config = require'lspconfig'
local snore = {silent = true, noremap = true}
local map = vim.api.nvim_buf_set_keymap
local on_attach = function(_, bufnr)
	print("LSP started!")
	-- REMAPS ====================================
	-- Note : For leader key, check 'basic' file
	map(bufnr, 'n', '<leader>dc', '<cmd>lua vim.lsp.buf.declaration()<CR>', snore)    -- Instantly go to declaration of something under cursor
	map(bufnr, 'n', '<leader>df', '<cmd>lua vim.lsp.buf.definition()<CR>', snore)     -- Instantly go to definition of something under cursor
	map(bufnr, 'n', '<leader>cs', '<cmd>lua vim.lsp.buf.server_ready()<CR>', snore)   -- Checks whether the server in current buffer is ready
	map(bufnr, 'n', '<leader>k', '<cmd>lua vim.lsp.buf.type_definition()<CR>', snore) -- Describe type of something under cursor [Do twice to go to floating window]
	map(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', snore)                   -- Describes something under cursor
	map(bufnr, 'n', '<F1>', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', snore)           -- Completion feature
end

-- UI ============================================
local signs = {Error = "X ", Warn = "! ", Hint = "? ", Info = "i "}
local fn = vim.fn
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	fn.sign_define(hl, {text = icon, texthl = hl, numhl = hl})
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

-- START =========================================
-- Add more in 'servers' table based on what language you usually work with
local servers = {"gopls", "sumneko_lua", "pyright"}
for _, serv in ipairs(servers) do
	lsp_config[serv].setup{
		on_attach = on_attach,
		handlers = handlers,
	}
end

-- Self note ====================================
--
-- > Lua | sumneko_lua [Install via lsp_installer]
-- 	==> First time setting this on other machine,
-- 		don't forget to add lua_language_server binary location to PATH (Windows)
--
-- > Go | gopls [Install via cmd: ]
--
-- > Python | pyright [Install via pip: pip install pyright]
