local ok, flutter = pcall(require, "flutter-tools")

if not ok then
	return
end

flutter.setup({
	on_attach = require("config.lsp").on_attach,
	capabilities = require("config.lsp").capabilities,
	debugger = {
		enabled = true,
		run_via_dap = true,
	},
	widget_guides = {
		enabled = false,
	},
	lsp = {
		color = {
			enabled = true,
			background = true,
			virtual_text = false,
		},
	},
	outline = { auto_open = false },
	decorations = {
		statusline = { device = true, app_version = true },
	},
	closing_tags = {
		highlight = "ErrorMsg", -- highlight for the closing tag
		prefix = ">", -- character to use for close tag e.g. > Widget
		enabled = false, -- set to false to disable
	},
	settings = {
		showTodos = true,
		renameFilesWithClasses = "prompt",
	},
})
