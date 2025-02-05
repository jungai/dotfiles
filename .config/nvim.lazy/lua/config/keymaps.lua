-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = LazyVim.safe_keymap_set

-- window
map("n", "<leader>w_", "<C-preW>s", { desc = "Split Window Below", remap = true })
map("n", "<leader>_", "<C-preW>s", { desc = "Split Window Below", remap = true })
map("n", "<leader>-", "<C-W>v", { desc = "Split Window Right", remap = true })
map("n", "<leader>w-", "<C-W>v", { desc = "Split Window Right", remap = true })

-- diagnostics
map("n", "<leader>D", vim.diagnostic.open_float, { desc = "Show Diagnostics" })

-- lazygit
if vim.fn.executable("lazygit") == 1 then
  map("n", "<leader>lg", function()
    Snacks.lazygit({ cwd = LazyVim.root.git() })
  end, { desc = "Lazygit (Root Dir)" })
  map("n", "<leader>lb", function()
    Snacks.git.blame_line()
  end, { desc = "Git Blame Line" })
  map("n", "<leader>ln", function()
    Snacks.gitbrowse()
  end, { desc = "Git Browse" })
  map("n", "<leader>gf", function()
    Snacks.lazygit.log_file()
  end, { desc = "Lazygit Current File History" })
  map("n", "<leader>lh", function()
    Snacks.lazygit.log({ cwd = LazyVim.root.git() })
  end, { desc = "Lazygit Log" })
end

-- move line
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move Line Down" })
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move Line Up" })
