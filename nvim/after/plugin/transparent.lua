local ok, transparent = pcall(require, "transparent")

if not ok then
	return
end

transparent.setup({
	enable = true,
})