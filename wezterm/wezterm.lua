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
	}),
	-- front_end = "OpenGL",
	-- font_size = 18,
	font_size = 14,
	-- line_height = 1.618,
	line_height = 1.2,
	color_scheme = "Catppuccin Macchiato",
	window_background_opacity = 1,
	window_padding = {
		left = 0,
		right = 0,
		top = 0,
		bottom = 0,
	},
	hide_tab_bar_if_only_one_tab = true,
}
