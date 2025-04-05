return {
  'NeogitOrg/neogit',
  cmd = { 'Neogit' },
  keys = {
    { '<leader>ng', '<cmd>Neogit<cr>', { desc = 'Open [N]eo[g]it' } },
  },
  dependencies = {
    'nvim-lua/plenary.nvim', -- required
    'sindrets/diffview.nvim', -- optional - Diff integration
  },
  opts = {
    integrations = {
      diffview = true,
    },
  },
}
