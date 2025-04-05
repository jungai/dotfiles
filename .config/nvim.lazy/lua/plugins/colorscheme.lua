return {
  -- {
  --   "folke/tokyonight.nvim",
  --   opts = {
  --     transparent = true,
  --     styles = {
  --       sidebars = "transparent",
  --       floats = "transparent",
  --     },
  --   },
  -- },
  {
    "catppuccin/nvim",
    lazy = true,
    name = "catppuccin",
    config = function()
      require("catppuccin").setup({
        -- transparent_background = true,
        background = {
          light = "macchiato",
          dark = "macchiato",
        },
        integrations = {
          aerial = true,
          alpha = true,
          cmp = true,
          dashboard = true,
          flash = true,
          grug_far = true,
          gitsigns = true,
          headlines = true,
          illuminate = true,
          indent_blankline = { enabled = true },
          leap = true,
          lsp_trouble = true,
          mason = true,
          markdown = true,
          mini = true,
          native_lsp = {
            enabled = true,
            underlines = {
              errors = { "undercurl" },
              hints = { "undercurl" },
              warnings = { "undercurl" },
              information = { "undercurl" },
            },
          },
          navic = { enabled = true, custom_bg = "lualine" },
          neotest = true,
          neotree = true,
          noice = true,
          notify = true,
          semantic_tokens = true,
          telescope = true,
          treesitter = true,
          treesitter_context = true,
          which_key = true,
        },
      })
      local palette = require("catppuccin.palettes").get_palette("macchiato")

      vim.cmd.colorscheme("catppuccin-macchiato")

      vim.api.nvim_set_hl(0, "BlinkCmpMenu", { bg = palette.base })
      vim.api.nvim_set_hl(0, "BlinkCmpMenuBorder", { fg = palette.blue })
      vim.api.nvim_set_hl(0, "BlinkCmpDoc", { bg = palette.base })
      vim.api.nvim_set_hl(0, "BlinkCmpDocBorder", { fg = palette.blue })
      vim.api.nvim_set_hl(0, "BlinkCmpSignatureHelp", { bg = palette.base })
      vim.api.nvim_set_hl(0, "BlinkCmpSignatureHelpBorder", { fg = palette.blue })
      vim.api.nvim_set_hl(0, "BlinkCmpDocSeparator", { fg = palette.blue, bg = palette.base })

      -- Hide all semantic highlights until upstream issues are resolved (https://github.com/catppuccin/nvim/issues/480)
      for _, group in ipairs(vim.fn.getcompletion("@lsp", "highlight")) do
        vim.api.nvim_set_hl(0, group, {})
      end
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
}
