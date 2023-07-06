local wezterm = require("wezterm")

return {
	font = wezterm.font_with_fallback({ "Hack Nerd Font", "JetBrains Mono" }),
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
}