return {
  "saghen/blink.cmp",
  dependencies = {
    {
      "onsails/lspkind.nvim",
      "nvim-tree/nvim-web-devicons",
      "giuxtaposition/blink-cmp-copilot",
    },
  },
  opts = {
    appearance = {
      use_nvim_cmp_as_default = true,
      nerd_font_variant = "mono",
    },
    completion = {
      documentation = {
        auto_show = true,
        window = {
          border = "rounded",
        },
      },
      ghost_text = { enabled = true },
      menu = {
        border = "rounded",
        draw = {
          columns = {
            { "label", "label_description", gap = 1 },
            { "kind_icon", "kind", gap = 1 },
            { "source_name" },
          },
          components = {
            source_name = {
              text = function(ctx)
                return "[" .. ctx.source_name .. "]"
              end,
            },
            kind_icon = {
              ellipsis = false,
              text = function(ctx)
                local icon = ctx.kind_icon
                if vim.tbl_contains({ "Path" }, ctx.source_name) then
                  local dev_icon, _ = require("nvim-web-devicons").get_icon(ctx.label)
                  if dev_icon then
                    icon = dev_icon
                  end
                elseif ctx.source_name == "Copilot" then
                  icon = ""
                else
                  icon = require("lspkind").symbolic(ctx.kind, {
                    mode = "symbol",
                  })
                end
                return icon .. ctx.icon_gap
              end,
              highlight = function(ctx)
                local hl = ctx.kind_hl
                if vim.tbl_contains({ "Path" }, ctx.source_name) then
                  local dev_icon, dev_hl = require("nvim-web-devicons").get_icon(ctx.label)
                  if dev_icon then
                    hl = dev_hl
                  end
                end
                return hl
              end,
            },
          },
        },
      },
    },
    signature = { window = { border = "single" } },
    sources = {
      default = { "lsp", "path", "snippets", "buffer", "copilot" },
      providers = {
        copilot = {
          name = "copilot",
          module = "blink-cmp-copilot",
          score_offset = 100,
          async = true,
        },
        buffer = {
          max_items = 5,
        },
        lsp = {
          score_offset = 5,
        },
        path = {
          max_items = 3,
        },
      },
    },
  },
}
