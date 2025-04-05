return {
  {
    'MagicDuck/grug-far.nvim',
    lazy = true,
    cmd = {
      'GrugFar',
    },
    keys = {
      {
        '<leader>ra',
        '<cmd>GrugFar<CR>',
        desc = '[R]eplace [A]ll',
        remap = true,
      },
    },
    config = true,
  },
}
