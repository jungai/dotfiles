local ok, snip = pcall(require, "luasnip.loaders.from_vscode")

if not ok then
	return
end

snip.lazy_load()