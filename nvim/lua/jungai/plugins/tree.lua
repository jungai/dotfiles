local ok, tree = pcall(require, "nvim-tree")

if not ok then
  return
end

vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

-- change color for arrows in tree to light blue
vim.cmd([[ highlight NvimTreeIndentMarker guifg=#3FC5FF ]])

tree.setup({
 actions = {
   open_file = {
     window_picker = {
       enable = false,
     }
   }
 }
})

