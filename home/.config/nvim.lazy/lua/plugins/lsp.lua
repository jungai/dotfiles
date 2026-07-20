return {
  "neovim/nvim-lspconfig",
  opts = {
    inlay_hints = {
      enabled = false,
    },
    servers = {
      tailwindcss = {
        settings = {
          tailwindCSS = {
            experimental = {
              classRegex = {
                -- Add your class regex patterns here
                "tw`([^`]*)", -- Match tw`...`
                'tw="([^"]*)', -- Match tw="..."
                'tw={"([^"}]*)', -- Match tw={"..."}
                "class: '([^']*)", -- Match class: '...'
                'class="([^"]*)', -- Match class="..."
                { "clsx\\(([^)]*)\\)", "(?:'|\"|`)([^']*)(?:'|\"|`)" }, -- Match clsx(...)
                { "cva\\(([^)]*)\\)", "(?:'|\"|`)([^']*)(?:'|\"|`)" }, -- Match cva(...)
                { "cn\\(([^)]*)\\)", "(?:'|\"|`)([^']*)(?:'|\"|`)" }, -- Match cn(...)
              },
            },
          },
        },
      },
    },
  },
}
