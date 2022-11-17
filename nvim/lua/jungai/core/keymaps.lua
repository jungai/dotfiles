vim.g.mapleader = " "
local keymap = vim.keymap

keymap.set("n", "<leader>nh", ":noh<CR>")
-- not save to buffer
keymap.set("n", "x", "\"_x")

-- adding number
keymap.set("n", "<leader>+", "<C-a>")
keymap.set("n", "<leader>-", "<C-x>")

