return {
  'dmtrKovalenko/fff.nvim',
  build = function()
    -- downloads a prebuilt binary or falls back to cargo build
    require('fff.download').download_or_build_binary()
  end,
  -- for nixos:
  -- build = "nix run .#release",
  opts = {
    prompt = '> ',
    debug = {
      enabled = true,
      show_scores = true,
    },
    layout = {
      height = 1,
      width = 1,
      prompt_position = 'top', -- or 'top'
      preview_position = 'right', -- 'left' | 'right' | 'top' | 'bottom'
      preview_size = 0.5,
      flex = { size = 130, wrap = 'top' },
      min_list_height = 10, --  do not display anything except the list below this threshold
      show_scrollbar = true,
      path_shorten_strategy = 'middle_number', -- 'middle_number' | 'middle' | 'end' | 'start'
      anchor = 'center',
    },
  },
  lazy = false, -- the plugin lazy-initialises itself
  keys = {
    {
      'ff',
      function()
        require('fff').find_files()
      end,
      desc = 'FFFind files',
    },
    {
      'fg',
      function()
        require('fff').live_grep()
      end,
      desc = 'LiFFFe grep',
    },
    {
      'fz',
      function()
        require('fff').live_grep { grep = { modes = { 'fuzzy', 'plain' } } }
      end,
      desc = 'Live fffuzy grep',
    },
    {
      'fc',
      function()
        require('fff').live_grep { query = vim.fn.expand '<cword>' }
      end,
      desc = 'Search current word',
    },
  },
}
