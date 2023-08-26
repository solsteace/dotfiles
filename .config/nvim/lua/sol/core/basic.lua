--[[ Notes
	[O] Remember to install your desired font first!
		https://www.nerdfonts.com/font-downloads
]]--

local set = vim.opt
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
	set.pumblend = 0
	set.shiftwidth = 4
	set.tabstop = 4
	set.laststatus = 3

	set.colorcolumn = "90"
	set.background = 'dark'
	set.clipboard = "unnamedplus"
	set.fileencoding = "utf-8"
	set.guifont = "Hack Nerd Font Mono:h10"
	
	local env = package.config:sub(1, 1)
	if env == '\\' then -- Windows
		set.shell = "powershell"
		set.shellcmdflag = "-c"
		set.shellxquote = "" -- for run powershell command through nvim command
	elseif env == '/' then -- UNIX
		-- For clipboard, fedore requires wl-clipboard
		-- Config here...
	end 

	set.listchars = {tab = '┊ ' }
	set.wildmode = {'full'}
	set.fillchars = {vert='║', foldclose = '⠗', foldopen = '⠴'}

	vim.cmd [[syntax on]]
