local wezterm = require("wezterm")

return {
	font = wezterm.font_with_fallback({
		-- "Mononoki Nerd Font",
		-- "Fira Code",
		-- "Operator Mono",
		-- "hack Nerd Font",
		-- "Zed Mono Extended",
		-- "Monaspace Neon",
		{
			family = "Dank Mono",
			-- italic = true,
		},
		-- "JetBrains Mono",
	}),
	font_size = 18,
	line_height = 1.618,
	color_scheme = "Catppuccin Mocha",
	window_background_opacity = 0.90,
	window_decorations = "RESIZE",
	window_padding = {
		left = 0,
		right = 0,
		top = 0,
		bottom = 0,
	},
	hide_tab_bar_if_only_one_tab = true,
	-- window_background_image = "/Users/worapholw/Desktop/lofi.jpg",
	-- window_background_image_hsb = {
	-- 	-- Darken the background image by reducing it to 1/3rd
	-- 	brightness = 0.01,
	-- 	-- You can adjust the hue by scaling its value.
	-- 	-- a multiplier of 1.0 leaves the value unchanged.
	-- 	hue = 1.0,
	-- 	-- You can adjust the saturation also.
	-- 	saturation = 1.0,
	-- },
}
