local ok, db = pcall(require, "dashboard")

if not ok then
	return
end

-- macos
db.custom_header = {
	"          ▀████▀▄▄              ▄█ ",
	"            █▀    ▀▀▄▄▄▄▄    ▄▄▀▀█ ",
	"    ▄        █          ▀▀▀▀▄  ▄▀  ",
	"   ▄▀ ▀▄      ▀▄              ▀▄▀  ",
	"  ▄▀    █     █▀   ▄█▀▄      ▄█    ",
	"  ▀▄     ▀▄  █     ▀██▀     ██▄█   ",
	"   ▀▄    ▄▀ █   ▄██▄   ▄  ▄  ▀▀ █  ",
	"    █  ▄▀  █    ▀██▀    ▀▀ ▀▀  ▄▀  ",
	"   █   █  █      ▄▄           ▄▀   ",
}

db.custom_center = {
	{
		-- icon = "  ",
		desc = "Find  File",
		action = "Telescope find_files find_command=rg,--hidden,--files",
		-- shortcut = "SPC ff",
	},
	{
		-- icon = "  ",
		desc = "Open Tree",
		action = "NvimTreeToggle",
	},
	{
		-- icon = "  ",
		desc = "Quit",
		action = "quit",
	},
}