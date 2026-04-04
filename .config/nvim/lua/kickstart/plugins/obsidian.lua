return {
  'obsidian-nvim/obsidian.nvim',
  version = '*', -- use latest release, remove to use latest commit
  ---@module 'obsidian'
  ---@type obsidian.config
  opts = {
    legacy_commands = false, -- this will be removed in the next major release
    workspaces = {
      {
        name = 'garden',
        path = '~/Desktop/garden',
      },
    },
    templates = {
      folder = 'templates',
      date_format = '%d-%m-%Y',
    },
  },
}
