return {
  'selimacerbas/mdkite.nvim',
  -- a kitehost.nvim checkout under another dir name needs its spec to
  -- say name = "kitehost.nvim", or lazy.nvim clones upstream beside it
  dependencies = { 'selimacerbas/kitehost.nvim' },
  -- kitehost.nvim v2.0.0 or newer, the first release with its Host check
  config = function()
    require('mdkite').setup {
      -- all optional; sane defaults shown
      instance_mode = 'takeover', -- "takeover" (one tab) or "multi" (tab per instance)
      port = 0, -- 0 = auto (8421 for takeover, OS-assigned for multi)
      open_browser = true,
      default_theme = 'dark', -- "dark" or "light"; initial preview theme
      debounce_ms = 300,
    }
  end,
}
