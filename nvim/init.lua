--[[ \-------------------------Lan's init.lua config ---------------------------------/
     |O'       ooooo      ooooo     ooooo      ooooo     oooooooooooooo             'O|              
     |'       o     o    o     o   o     o    o     o   o              o             '|
     |       o     o⣿   o       o o     o⣿   o     o⣿  oooooo    oooooo⡟              | 
     |      o     o⣿⡟  o         o     o⣿⡟  o     o⣿⡟  ⢻⣿⣿⡿o    o⣿⣿⣿⣿⣿⡟               | 
     |     o     o⣿⡟  o     o         o⣿⡟  o     o⣿⡟      o    o⣿⡟                    | 
     |    o     o⣿⡟  o     o⣿o       o⣿⡟  o     o⣿⡟      o    o⣿⡟                     | 
     |   o     o⣿⡟  o     o⣿⠏ o     o⣿⡟  o     o⣿⡟      o    o⣿⡟                      | 
     |   oooooo⣿⡟   oooooo⣿⠏   ooooo⣿⡟  ooooooo⣿⡟       ooooo⣿⡟                       | 
     |   ⢻⣿⣿⣿⣿⣿⡟    ⢻⣿⣿⣿⣿⡟     ⢻⣿⣿⣿⣿⡟   ⢻⣿⣿⣿⣿⣿⣿⡟        ⢻⣿⣿⣿⣿⡟                        | 
     |                       ooooo          ooooo     ooooo         oooooooooo        |
     |                      o     o        o     o   o     o      o           o       |
     |                     o     o⣿       o     o⣿  o     o⣿    o     ooo    o⣿       |
     |                    o     o⣿⡟      o     o⣿⡟ o     o⣿⡟  o     oooo    o⣿⡟       |
     |                   o     o⣿⡟      o     o⣿⡟ o     o⣿⡟  o             o⣿⡟        |
     |         oooo     o     ooooooo   o     oooo     o⣿⡟  o    ooooo    o⣿⡟         |
     |        o    o   o            oo  ⣿o            o⣿⡟  o    o⣿⣿⡿o    o⣿⡟          |
     |        ooooo⣿   ooooooooooooo⣿⡟  ⢿⣿oooooooooooo⣿⡟  oooooo⣿⡟ oooooo⣿⡟           |
     |.       ⢻⣿⣿⣿⣿⡟   ⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟    ⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟   ⢻⣿⣿⣿⣿⣿⡟  ⢻⣿⣿⣿⣿⣿⡟           .|
     |O.                                                                            .O|
     /--------------------------------------------------------------------------------\
      NOTE : Please do read some comment on what should be done/installed
             before using this dotfile. Any error occured won't make the
             settings be loaded
]]--

for _, module in ipairs({'basic', 'remaps', 'paq'}) do
	local _, is_okay = pcall(require, module)
	if is_okay then
		require(module)
	end
end

--[[ Jump here ===================
	 lua/basic
	 lua/remaps
]]--
