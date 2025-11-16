return {
  'rachartier/tiny-inline-diagnostic.nvim',
  event = 'VeryLazy',
  priority = 1000,
  opts = {
    options = {
      add_messages = {
        display_count = true,
      },
      multilines = {
        enabled = true,
      },
    },
  },
}
