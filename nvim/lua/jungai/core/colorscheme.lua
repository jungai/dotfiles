local custom_highlight = vim.api.nvim_create_augroup("CustomHighlight", {})
vim.api.nvim_create_autocmd("ColorScheme", {
	pattern = "nightfly",
	callback = function()
		vim.api.nvim_set_hl(0, "DiagnosticVirtualTextError", { link = "NightflyRed" })
		vim.api.nvim_set_hl(0, "DiagnosticVirtualTextWarn", { link = "NightflyYellow" })
		vim.api.nvim_set_hl(0, "DiagnosticVirtualTextInfo", { link = "NightflyBlue" })
		vim.api.nvim_set_hl(0, "DiagnosticVirtualTextHint", { link = "NightflyWhite" })
	end,
	group = custom_highlight,
})

local ok, _ = pcall(vim.cmd, "colorscheme nightfly")

if not ok then
	print("color scheme not found")
	return
end