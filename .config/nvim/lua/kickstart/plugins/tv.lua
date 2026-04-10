return {
  'alexpasmantier/tv.nvim',
  config = function()
    local h = require('tv').handlers

    require('tv').setup {
      window = {
        width = 1, -- 80% of editor width
        height = 1, -- 80% of editor height
        border = 'none',
        title = ' tv.nvim ',
        title_pos = 'center',
      },
      -- per-channel configurations
      channels = {
        -- `files`: fuzzy find files in your project
        files = {
          keybinding = '<leader>ff', -- Launch the files channel
          -- what happens when you press a key
          handlers = {
            ['<CR>'] = h.open_as_files, -- default: open selected files
            ['<C-q>'] = h.send_to_quickfix, -- send to quickfix list
            ['<C-s>'] = h.open_in_split, -- open in horizontal split
            ['<C-v>'] = h.open_in_vsplit, -- open in vertical split
            ['<C-y>'] = h.copy_to_clipboard, -- copy paths to clipboard
          },
        },
        -- `text`: ripgrep search through file contents
        text = {
          keybinding = '<leader>fg',
          handlers = {
            ['<CR>'] = h.open_at_line, -- Jump to line:col in file
            ['<C-q>'] = h.send_to_quickfix, -- Send matches to quickfix
            ['<C-s>'] = h.open_in_split, -- Open in horizontal split
            ['<C-v>'] = h.open_in_vsplit, -- Open in vertical split
            ['<C-y>'] = h.copy_to_clipboard, -- Copy matches to clipboard
          },
        },
      },
    }
  end,
}
