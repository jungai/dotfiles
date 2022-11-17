local ok, _ = pcall(vim.cmd, "colorscheme nightfly")

if not ok then
  print("color scheme not found")
  return
end
