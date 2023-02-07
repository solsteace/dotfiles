-- Requires: Alpha
local aug = vim.api.nvim_create_augroup
local auc = vim.api.nvim_create_autocmd

auc("TermOpen", {
	command = "lua k=2"
})
