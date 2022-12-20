-- vscode
vim.o.background = "dark"

local ok, vscode = pcall(require, "vscode.colors")

if not ok then
	return
end

vscode.setup({
	-- Enable transparent background
	transparent = true,

	-- Enable italic comment
	italic_comments = true,

	-- Disable nvim-tree background color
	disable_nvimtree_bg = true,

	-- Override colors (see ./lua/vscode/colors.lua)
	color_overrides = {
		vscLineNumber = "#FFFFFF",
	},

	-- Override highlight groups (see ./lua/vscode/theme.lua)
	group_overrides = {
		-- this supports the same val table as vim.api.nvim_set_hl
		-- use colors from this colorscheme by requiring vscode.colors!
		Cursor = { fg = c.vscDarkBlue, bg = c.vscLightGreen, bold = true },
})

-- local custom_highlight = vim.api.nvim_create_augroup("CustomHighlight", {})
-- vim.api.nvim_create_autocmd("ColorScheme", {
-- 	pattern = "nightfly",
-- 	callback = function()
-- 		vim.api.nvim_set_hl(0, "DiagnosticVirtualTextError", { link = "NightflyRed" })
-- 		vim.api.nvim_set_hl(0, "DiagnosticVirtualTextWarn", { link = "NightflyYellow" })
-- 		vim.api.nvim_set_hl(0, "DiagnosticVirtualTextInfo", { link = "NightflyBlue" })
-- 		vim.api.nvim_set_hl(0, "DiagnosticVirtualTextHint", { link = "NightflyWhite" })
-- 	end,
-- 	group = custom_highlight,
-- })
-- --
-- local ok, _ = pcall(vim.cmd, "colorscheme nightfly")
--
-- if not ok then
-- 	print("color scheme not found")
-- 	return
-- end
--
-- local ok, neo = pcall(require, "neosolarized")
--
-- if not ok then
-- 	return
-- end
--
-- neo.setup({
-- 	comment_italics = true,
-- })
--
-- local cb = require("colorbuddy.init")
-- local Color = cb.Color
-- local colors = cb.colors
-- local Group = cb.Group
-- local groups = cb.groups
-- local styles = cb.styles
--
-- Color.new("black", "#000000")
-- Group.new("CursorLine", colors.none, colors.base03, styles.NONE, colors.base1)
-- Group.new("CursorLineNr", colors.yellow, colors.black, styles.NONE, colors.base1)
-- Group.new("Visual", colors.none, colors.base03, styles.reverse)
--
-- local cError = groups.Error.fg
-- local cInfo = groups.Information.fg
-- local cWarn = groups.Warning.fg
-- local cHint = groups.Hint.fg
--
-- Group.new("DiagnosticVirtualTextError", cError, cError:dark():dark():dark():dark(), styles.NONE)
-- Group.new("DiagnosticVirtualTextInfo", cInfo, cInfo:dark():dark():dark(), styles.NONE)
-- Group.new("DiagnosticVirtualTextWarn", cWarn, cWarn:dark():dark():dark(), styles.NONE)
-- Group.new("DiagnosticVirtualTextHint", cHint, cHint:dark():dark():dark(), styles.NONE)
-- Group.new("DiagnosticUnderlineError", colors.none, colors.none, styles.undercurl, cError)
-- Group.new("DiagnosticUnderlineWarn", colors.none, colors.none, styles.undercurl, cWarn)
-- Group.new("DiagnosticUnderlineInfo", colors.none, colors.none, styles.undercurl, cInfo)
-- Group.new("DiagnosticUnderlineHint", colors.none, colors.none, styles.undercurl, cHint)