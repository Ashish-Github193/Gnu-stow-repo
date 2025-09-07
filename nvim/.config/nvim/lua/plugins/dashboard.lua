function MULTILINE_TO_LIST(str)
	local lines = {}
	for line in str:gmatch("([^\n]*)\n?") do
		if line ~= "" then
			table.insert(lines, line)
		end
	end
	return lines
end

require("dashboard").setup({
	theme = "hyper",
	config = {
		header = MULTILINE_TO_LIST([[
⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣤⣾⣿⢿⣿⣶⡤⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠾⢿⣧⣹⣻⢯⡿⣻⢿⡛⣦⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⢘⡦⠺⢵⣟⡥⠄⢣⡯⡄⣸⠂⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠹⣲⣶⣸⠀⠐⣘⣉⣱⠂⠉⡇⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⢃⡽⢻⢃⣾⣿⣿⣿⣿⡧⠚⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠩⣙⣧⣾⣿⣿⣿⣿⣿⣿⣀⢀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⢀⣤⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣦⡀⠀⠀⠀⠀⠀
⠀⠀⢀⣤⣶⣿⣿⣿⣿⣿⣿⣿⣿⢿⣻⣿⣿⣿⣿⣿⣿⡿⢿⣦⣀⡀⠀⠀
⠀⢀⣿⣿⣿⣿⢷⣿⣿⣿⣿⡿⣿⡿⢿⣿⢿⡿⢻⣿⣿⣿⣿⣿⣿⣯⡄⠀
⠀⡜⠛⢉⠯⠘⠿⣻⠿⡟⡯⢗⣠⣵⡾⣾⣶⣼⢿⢿⡻⢷⡻⡿⢹⡿⢿⡄
⠀⠇⣴⣾⡷⠄⠀⢈⢩⢃⣤⣾⣟⡻⢃⡻⣟⢿⣶⣠⠉⠆⠀⢠⣿⣿⣧⠀
⠀⣿⡿⣿⣷⡃⠀⠀⣠⣿⡿⣟⣿⣯⣴⢿⣿⣾⡟⣧⡲⠉⠀⣾⣿⣿⢿⢣
⢰⠉⢸⢿⣣⠄⠀⠾⣙⠂⣯⢿⢏⠳⢼⢫⠟⡷⡉⠸⢅⡄⠀⢿⣿⢟⣅⠈
⠀⣰⣦⡀⣁⠀⢆⠀⠰⠚⠁⢺⡌⢳⢸⠚⣎⠱⠁⠘⠀⠁⡅⠘⢿⣿⣿⡆
⠀⡽⣻⡿⡄⠀⣿⠀⠀⠀⠀⠀⠀⣠⣘⢃⠀⠀⠀⠀⠀⢀⣿⡠⣿⣿⣿⢀
]]),
		shortcut = {},
		packages = { enable = true }, -- show how many plugins neovim loaded
		project = { enable = false },
		mru = { enable = false },
		footer = {}, -- footer
	},
})
