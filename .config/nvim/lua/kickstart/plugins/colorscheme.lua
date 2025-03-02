return {
  {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000,
    opts = {},
    init = function()
      vim.cmd [[colorscheme tokyonight-moon]]
    end,
  },
  -- {
  --   'catppuccin/nvim',
  --   lazy = true,
  --   name = 'catppuccin',
  --   opts = {
  --     -- transparent_background = true,
  --     background = {
  --       light = 'macchiato',
  --       dark = 'macchiato',
  --     },
  --     integrations = {
  --       aerial = true,
  --       alpha = true,
  --       cmp = true,
  --       dashboard = true,
  --       flash = true,
  --       grug_far = true,
  --       gitsigns = true,
  --       headlines = true,
  --       illuminate = true,
  --       indent_blankline = { enabled = true },
  --       leap = true,
  --       lsp_trouble = true,
  --       mason = true,
  --       markdown = true,
  --       mini = true,
  --       native_lsp = {
  --         enabled = true,
  --         underlines = {
  --           errors = { 'undercurl' },
  --           hints = { 'undercurl' },
  --           warnings = { 'undercurl' },
  --           information = { 'undercurl' },
  --         },
  --       },
  --       navic = { enabled = true, custom_bg = 'lualine' },
  --       neotest = true,
  --       neotree = true,
  --       noice = true,
  --       notify = true,
  --       semantic_tokens = true,
  --       telescope = true,
  --       treesitter = true,
  --       treesitter_context = true,
  --       which_key = true,
  --     },
  --   },
  --   init = function()
  --     vim.cmd [[colorscheme catppuccin-macchiato]]
  --   end,
  -- },
}
