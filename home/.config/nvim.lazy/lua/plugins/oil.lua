return {
  {
    "stevearc/oil.nvim",
    cmd = "Oil",
    keys = {
      { "-", "<cmd>Oil<cr>", mode = "n", desc = "Open parent directory" },
    },
    -- Optional dependencies
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      view_options = {
        show_hidden = true,
      },
      -- Configuration for the floating window in oil.open_float
      float = {
        -- Padding around the floating window
        padding = 2,
        max_width = 0,
        max_height = 0,
        border = "rounded",
        win_options = {
          winblend = 0,
        },
        -- This is the config that will be passed to nvim_open_win.
        -- Change values here to customize the layout
        override = function(conf)
          return conf
        end,
      },
      progress = {
        max_width = 0.9,
        min_width = { 40, 0.4 },
        width = nil,
        max_height = { 10, 0.9 },
        min_height = { 5, 0.1 },
        height = nil,
        border = "rounded",
        minimized_border = "none",
        win_options = {
          winblend = 0,
        },
      },
      -- Configuration for the floating SSH window
      ssh = {
        border = "rounded",
      },
      -- Configuration for the floating keymaps help window
      keymaps_help = {
        border = "rounded",
      },
    },
  },
}
