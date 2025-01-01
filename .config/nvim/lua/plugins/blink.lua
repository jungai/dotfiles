return {
  "saghen/blink.cmp",
  opts = {
    signature = { window = { border = "rounded" } },
    completion = {
      documentation = {
        window = {
          border = "rounded",
          winhighlight = "Normal:BlinkCmpDoc,FloatBorder:BlinkCmpDocBorder,CursorLine:BlinkCmpDocCursorLine,Search:None",
        },
      },
      menu = {
        border = "rounded",
        winhighlight = "Normal:BlinkCmpDoc,FloatBorder:BlinkCmpDocBorder,CursorLine:BlinkCmpDocCursorLine,Search:None",
      },
    },
    sources = {
      -- add lazydev to your completion providers
      default = { "lazydev" },
      providers = {
        lazydev = {
          name = "LazyDev",
          module = "lazydev.integrations.blink",
          score_offset = 100, -- show at a higher priority than lsp
          min_keyword_length = 1,
        },
      },
    },
  },
}
