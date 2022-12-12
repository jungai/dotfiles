vim.g.mapleader = " "
local keymap = vim.keymap

keymap.set("n", "<leader>n", ":noh<CR>")
-- not save to buffer
keymap.set("n", "x", '"_x')

-- adding number
keymap.set("n", "<leader>+", "<C-a>")
keymap.set("n", "<leader>-", "<C-x>")

-- window
keymap.set("n", "<leader>sv", "<C-w>v")
keymap.set("n", "<leader>sh", "<C-w>s")
keymap.set("n", "<leader>se", "<C-w>=")
keymap.set("n", "<leader>sw", ":close<CR>")

-- tab
keymap.set("n", "<leader>to", ":tabnew<CR>")
keymap.set("n", "<leader>tw", ":tabclose<CR>")
keymap.set("n", "<leader>[", ":tabn<CR>")
keymap.set("n", "<leader>]", ":tabp<CR>")
keymap.set("n", "<TAB>", ":BufferLineCycleNext<CR>")
keymap.set("n", "<leader>w", ":bd<CR>")

keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>")

-- tree
-- keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")
keymap.set("n", "<leader>e", ":NvimTreeFindFileToggle<CR>")

-- telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>") -- find files within current working directory, respects .gitignore
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>") -- find string in current working directory as you type
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>") -- find string under cursor in current working directory
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>") -- list open buffers in current neovim instance
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>") -- list available help tags
keymap.set("n", "<leader>fe", "<cmd>Telescope file_browser<cr>")
keymap.set("n", "<leader>fu", "<cmd>Telescope flutter commands<cr>")

-- rest
keymap.set("n", "<leader>rr", "<Plug>RestNvim")
keymap.set("n", "<leader>rp", "<Plug>RestNvimPreview")

-- trouble
keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<CR>", { silent = true, noremap = true })