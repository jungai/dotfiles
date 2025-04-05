return {
  { -- Add indentation guides even on blank lines
    'lukas-reineke/indent-blankline.nvim',
    -- Enable `lukas-reineke/indent-blankline.nvim`
    event = 'BufEnter',
    main = 'ibl',
    -- See `:help ibl`
    opts = {},
  },
}
