local ok, luasnip = pcall(require, "luasnip")

if not ok then
	return
end

luasnip.filetype_extend("dart", { "flutter" })