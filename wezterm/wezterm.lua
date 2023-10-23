local wezterm = require("wezterm")

return {
	font = wezterm.font_with_fallback({
		"Mononoki Nerd Font",
		"Fira Code",
		"Operator Mono",
		"Hack Nerd Font",
		"JetBrains Mono",
	}),
	font_size = 16,
	color_scheme = "Rosé Pine (base16)",
	window_background_opacity = 0.95,
	window_decorations = "RESIZE",

	window_padding = {
		left = 0,
		right = 0,
		top = 0,
		bottom = 0,
	},
	hide_tab_bar_if_only_one_tab = true,
	window_background_image = "/Users/jungai/Desktop/lofi.jpg",
	window_background_image_hsb = {
		-- Darken the background image by reducing it to 1/3rd
		brightness = 0.01,
		-- You can adjust the hue by scaling its value.
		-- a multiplier of 1.0 leaves the value unchanged.
		hue = 1.0,
		-- You can adjust the saturation also.
		saturation = 1.0,
	},
}