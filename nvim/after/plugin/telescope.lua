local telescope_setup, telescope = pcall(require, "telescope")
if not telescope_setup then
	return
end

local actions_setup, actions = pcall(require, "telescope.actions")
if not actions_setup then
	return
end

telescope.setup({
	-- configure custom mappings
	defaults = {
		borderchars = {
			prompt = { "─", " ", " ", " ", "─", "─", " ", " " },
			results = { " " },
			preview = { " " },
		},
		mappings = {
			i = {
				["<C-k>"] = actions.move_selection_previous, -- move to prev result
				["<C-j>"] = actions.move_selection_next, -- move to next result
				-- ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist, -- send selected to quickfixlist
			},
		},
		file_ignore_patterns = {
			"node_modules",
			".git",
		},
	},
	pickers = {
		find_files = {
			hidden = true,
		},
		live_grep = {
			hidden = true,
		},
		file_browser = {
			hidden = true,
		},
	},
})

telescope.load_extension("fzf")
-- telescope.load_extension("file_browser")
telescope.load_extension("flutter")