return {
  {
    'MagicDuck/grug-far.nvim',
    lazy = true,
    cmd = {
      'GrugFar',
    },
    keys = {
      {
        '<leader>sf',
        '<cmd>GrugFar<CR>',
        desc = '[S]earch and [R]eplace',
        remap = true,
      },
    },
    config = true,
  },
}
