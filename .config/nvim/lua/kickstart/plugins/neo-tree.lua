-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
  'nvim-neo-tree/neo-tree.nvim',
  branch = 'v3.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
    -- {"3rd/image.nvim", opts = {}}, -- Optional image support in preview window: See `# Preview Mode` for more information
  },
  cmd = 'Neotree',
  keys = {
    {
      '<leader>e',
      function()
        require('neo-tree.command').execute { toggle = true }
      end,
      desc = 'Explorer NeoTree (Root Dir)',
      remap = true,
    },
    {
      '<leader>E',
      function()
        require('neo-tree.command').execute { toggle = true, dir = vim.uv.cwd() }
      end,
      desc = 'Explorer NeoTree (cwd)',
      remap = true,
    },
  },
  deactivate = function()
    vim.cmd [[Neotree close]]
  end,
  opts = {
    window = {
      position = 'float',
    },
    commands = {
      system_open = function(state)
        local node = state.tree:get_node()
        local path = node:get_id()
        -- macOs: open file in default application in the background.
        vim.fn.jobstart({ 'open', path }, { detach = true })
        -- Linux: open file in default application
        vim.fn.jobstart({ 'xdg-open', path }, { detach = true })

        -- Windows: Without removing the file from the path, it opens in code.exe instead of explorer.exe
        local p
        local lastSlashIndex = path:match '^.+()\\[^\\]*$' -- Match the last slash and everything before it
        if lastSlashIndex then
          p = path:sub(1, lastSlashIndex - 1) -- Extract substring before the last slash
        else
          p = path -- If no slash found, return original path
        end
        vim.cmd('silent !start explorer ' .. p)
      end,
    },
    filesystem = {
      bind_to_cwd = false,
      follow_current_file = { enabled = true },
      use_libuv_file_watcher = true,
      window = {
        mappings = {
          ['O'] = 'system_open',
        },
      },
      filtered_items = {
        visible = false, -- when true, they will just be displayed differently than normal items
        hide_dotfiles = false,
        hide_gitignored = false,
        hide_hidden = false, -- only works on Windows for hidden files/directories
      },
    },
  },
}
