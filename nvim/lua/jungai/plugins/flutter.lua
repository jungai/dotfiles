local ok, flutter = pcall(require, "flutter-tools")

if not ok then
	return
end

flutter.setup()
