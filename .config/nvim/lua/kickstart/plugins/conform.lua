return { -- Autoformat
  'stevearc/conform.nvim',
  event = { 'BufWritePre' },
  cmd = { 'ConformInfo' },
  keys = {
    {
      '<leader>cf',
      function()
        require('conform').format { async = true, lsp_format = 'fallback' }
      end,
      mode = '',
      desc = '[F]ormat buffer',
    },
  },
  opts = {
    log_level = vim.log.levels.DEBUG,
    notify_on_error = true,
    format_on_save = function(bufnr)
      -- Disable "format_on_save lsp_fallback" for languages that don't
      -- have a well standardized coding style. You can add additional
      -- languages here or re-enable it for the disabled ones.
      local disable_filetypes = { c = true, cpp = true }
      if disable_filetypes[vim.bo[bufnr].filetype] then
        return nil
      else
        return {
          async = true,
          timeout_ms = 1500,
          lsp_format = 'fallback',
        }
      end
    end,
    formatters_by_ft = {
      lua = { 'stylua' },
      rust = { 'rustfmt' },
      -- You can use 'stop_after_first' to run the first available formatter from the list
      javascript = { 'oxlint', 'oxfmt' },
      javascriptreact = { 'oxlint', 'oxfmt' },
      typescript = { 'oxlint', 'oxfmt' },
      typescriptreact = { 'oxlint', 'oxfmt' },
      svelte = { 'eslint_d', 'prettier' },
      json = { 'oxfmt', 'prettier', stop_after_first = true },
      markdown = { 'oxfmt', 'prettier', stop_after_first = true },
      mdx = { 'oxfmt', 'prettier', stop_after_first = true },
      css = { 'oxfmt', 'prettier', stop_after_first = true },
      ['*'] = { 'codespell' },
      ['_'] = { 'trim_whitespace' },
    },
  },
}
