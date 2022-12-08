local ok, cinnamon = pcall(require, "cinnamon")

if not ok then
	return
end

cinnamon.setup()