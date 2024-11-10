local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- config
-- config.color_scheme = "Catppuccin Macchiato"
config.color_scheme = "Tokyo Night Storm"
config.font = wezterm.font_with_fallback({
	-- "Mononoki Nerd Font",
	-- "Fira Code",
	-- "Operator Mono",
	-- "hack Nerd Font",
	-- "Zed Mono Extended",
	-- "Monaspace Neon",
	-- "JetBrains Mono",
	-- {
	-- 	family = "DankMono Nerd Font",
	-- 	italic = false,
	-- },
	{
		family = "MonoLisa",
		harfbuzz_features = {
			"No calt", -- {|
			"zero", -- 0
			"ss01", -- *
			"ss02", -- f
			"ss04", -- g
			"ss07", -- { }
			"ss08", -- ( )
			"ss10", -- >=
			"ss11", -- 0xf
			"ss12", -- \\
			"ss13", -- $
			"ss14", -- &
			"ss15", -- i
			"ss16", -- r
			"ss17", -- .=
			"ss18", -- @
		},
		-- 	-- italic = true,
	},
})
config.front_end = "OpenGL"
config.font_size = 14
-- config.line_height = 1.2
config.window_background_opacity = 1
-- config.window_decorations = "RESIZE"
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}
config.hide_tab_bar_if_only_one_tab = true

-- then finally apply the plugin
-- these are currently the defaults:
-- wezterm.plugin.require("https://github.com/adriankarlen/bar.wezterm").apply_to_config(config, {
-- 	{
-- 		position = "bottom",
-- 		max_width = 32,
-- 		left_separator = "  ",
-- 		right_separator = "  ",
-- 		field_separator = "  |  ",
-- 		leader_icon = "",
-- 		workspace_icon = "",
-- 		pane_icon = "",
-- 		user_icon = "",
-- 		hostname_icon = "󰒋",
-- 		clock_icon = "󰃰",
-- 		cwd_icon = "",
-- 		enabled_modules = {
-- 			username = true,
-- 			hostname = true,
-- 			clock = true,
-- 			cwd = true,
-- 		},
-- 		ansi_colors = {
-- 			workspace = 8,
-- 			leader = 2,
-- 			pane = 7,
-- 			active_tab = 4,
-- 			inactive_tab = 6,
-- 			username = 6,
-- 			hostname = 8,
-- 			clock = 5,
-- 			cwd = 7,
-- 		},
-- 	},
-- })

return config
