local wezterm = require("wezterm")

return {
	font = wezterm.font_with_fallback({
		-- "Mononoki Nerd Font",
		-- "Fira Code",
		-- "Operator Mono",
		-- "hack Nerd Font",
		-- "Zed Mono Extended",
		-- "Monaspace Neon",
		-- "JetBrains Mono",
		{
			family = "DankMono Nerd Font",
			italic = false,
		},
	}),
	front_end = "OpenGL",
	font_size = 18,
	line_height = 1.618,
	color_scheme = "Catppuccin Macchiato",
	window_background_opacity = 0.90,
	window_padding = {
		left = 0,
		right = 0,
		top = 0,
		bottom = 0,
	},
	hide_tab_bar_if_only_one_tab = true,
}
