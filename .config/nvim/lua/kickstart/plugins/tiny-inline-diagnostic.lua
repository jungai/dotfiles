return {
  'rachartier/tiny-inline-diagnostic.nvim',
  event = 'VeryLazy',
  priority = 1000,
  opts = {
    preset = 'powerline',
    options = {
      add_messages = {
        messages = true,
      },
      multilines = {
        always_show = true,
        enabled = true,
      },
    },
  },
}
