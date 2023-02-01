--[[ Notes
	[O] Remember to install your desired font first!
		https://www.nerdfonts.com/font-downloads
]]--

local set = vim.opt
local seto = vim.o  -- Global
local setw = vim.wo -- Local to window
local setb = vim.bo -- Local to buffer
local cmd = vim.cmd -- Use to call vim commands

-- Settings ====================================================
	set.cursorline = true
	set.incsearch = true
	set.list = true
	set.number = true
	set.relativenumber = true
	set.termguicolors = true
	set.wildmenu = true
	set.wrap = false

	set.history = 500
	set.shiftwidth = 4
	set.tabstop = 4
	set.laststatus = 3

	set.background = 'dark'
	set.clipboard = "unnamedplus"
	set.fileencoding = "utf-8"
	set.guifont = "Hack Nerd Font Mono:h10"
	set.shell = "powershell"
	set.listchars = {tab = '┊ ' }
	set.wildmode = {'full'}
	set.fillchars = {vert='║', foldclose = '⠗', foldopen = '⠴'}

	cmd [[
		syntax on
	]]
