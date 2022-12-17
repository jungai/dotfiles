local ok, tree = pcall(require, "nvim-tree")

if not ok then
	return
end

vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

-- change color for arrows in tree to light blue
vim.cmd([[ highlight NvimTreeIndentMarker guifg=#3FC5FF ]])

vim.g.nvim_tree_show_icons = {
	git = 0,
	folders = 0,
	files = 0,
	folder_arrows = 0,
}

tree.setup({
	actions = {
		open_file = {
			window_picker = {
				enable = false,
			},
		},
	},
})