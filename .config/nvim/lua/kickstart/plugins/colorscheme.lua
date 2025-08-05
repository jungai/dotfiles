return {
  {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000,
    opts = {
      style = 'night',
    },
    init = function()
      vim.cmd [[colorscheme tokyonight]]
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
  --     styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
  --       comments = { 'italic' }, -- Change the style of comments
  --       conditionals = { 'italic' },
  --       loops = {},
  --       functions = {},
  --       keywords = {},
  --       strings = {},
  --       variables = {},
  --       numbers = {},
  --       booleans = {},
  --       properties = {},
  --       types = {},
  --       operators = {},
  --       -- miscs = {}, -- Uncomment to turn off hard-coded styles
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
