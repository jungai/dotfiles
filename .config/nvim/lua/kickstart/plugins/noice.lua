return {
  'folke/noice.nvim',
  event = 'VeryLazy',
  opts = {
    presets = {
      lsp_doc_border = true,
    },
  },
  dependencies = {
    -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
    'MunifTanjim/nui.nvim',
  },
}
