local ok, indent = pcall(require, "indent_blankline")

if not ok then
	return
end

vim.opt.list = true
vim.opt.listchars:append("eol:↴")

indent.setup({
	show_current_context = true,
	show_current_context_start = true,
	show_end_of_line = true,
})