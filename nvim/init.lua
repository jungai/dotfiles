-- variables
local cmd = vim.cmd  -- to execute Vim commands e.g. cmd('pwd')
local fn = vim.fn    -- to call Vim functions e.g. fn.bufnr()
local g = vim.g      -- a table to access global variables
local opt = vim.opt  -- to set options

-- vim setting
opt.hidden = true
opt.tabstop = 2
opt.shiftwidth = 2
opt.number = true
opt.hlsearch = true
opt.ruler = true
opt.expandtab = true
opt.smartindent = true
opt.ai = true
opt.termguicolors = true
opt.encoding = "utf-8"
opt.relativenumber = true
opt.smartcase = true
vim.o.completeopt = "menuone,noselect"

-- pacakage manager
cmd 'packadd paq-nvim'  

require "paq" {
  'editorconfig/editorconfig-vim';
	'sainnhe/gruvbox-material';
	'chriskempson/base16-vim';
  'savq/paq-nvim';
	'neovim/nvim-lspconfig';
	'glepnir/lspsaga.nvim';
	'hrsh7th/nvim-compe';
  'nvim-treesitter/nvim-treesitter';
  'navarasu/onedark.nvim';
  'hoob3rt/lualine.nvim';
  'kyazdani42/nvim-web-devicons';
  'nvim-lua/popup.nvim';
  'nvim-lua/plenary.nvim';
  'nvim-telescope/telescope.nvim';
}

-- theme
-- require('onedark').setup()
cmd 'colorscheme gruvbox-material'
cmd 'set background=dark'

-- lualine
require('lualine').setup()
--

-- compe
require'compe'.setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  resolve_timeout = 800;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = {
    border = { '', '' ,'', ' ', '', '', '', ' ' }, -- the border option is the same as `|help nvim_open_win|`
    winhighlight = "NormalFloat:CompeDocumentation,FloatBorder:CompeDocumentationBorder",
    max_width = 120,
    min_width = 60,
    max_height = math.floor(vim.o.lines * 0.3),
    min_height = 1,
  };

  source = {
    path = true;
    buffer = true;
    calc = true;
    nvim_lsp = true;
    nvim_lua = true;
    vsnip = true;
    ultisnips = true;
    luasnip = true;
  };
}

-- lsp config
require'lspconfig'.tsserver.setup{}
require'lspconfig'.vuels.setup{}
vim.api.nvim_set_keymap('n', 'gd', [[<cmd>lua vim.lsp.buf.definition()<CR>]], { noremap = true, silent = true })

-- lint

local on_attach = function(client, bufnr)
  if client.resolved_capabilities.document_formatting then
    vim.api.nvim_command [[augroup Format]]
    vim.api.nvim_command [[autocmd! * <buffer>]]
    vim.api.nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()]]
    vim.api.nvim_command [[augroup END]]
  end
end

require'lspconfig'.diagnosticls.setup {
  on_attach = on_attach,
  filetypes = { 'javascript', 'javascriptreact', 'json', 'typescript', 'typescriptreact', 'css', 'less', 'scss', 'markdown', 'pandoc' },
  init_options = {
    linters = {
      eslint = {
        command = 'eslint_d',
        rootPatterns = { '.git' },
        debounce = 100,
        args = { '--stdin', '--stdin-filename', '%filepath', '--format', 'json' },
        sourceName = 'eslint_d',
        parseJson = {
          errorsRoot = '[0].messages',
          line = 'line',
          column = 'column',
          endLine = 'endLine',
          endColumn = 'endColumn',
          message = '[eslint] ${message} [${ruleId}]',
          security = 'severity'
        },
        securities = {
          [2] = 'error',
          [1] = 'warning'
        }
      },
    },
    filetypes = {
      javascript = 'eslint',
      javascriptreact = 'eslint',
      typescript = 'eslint',
      typescriptreact = 'eslint',
    },
    formatters = {
      eslint_d = {
        command = 'eslint_d',
        args = { '--stdin', '--stdin-filename', '%filename', '--fix-to-stdout' },
        rootPatterns = { '.git' },
      },
      prettier = {
        command = 'prettier',
        args = { '--stdin-filepath', '%filename' }
      }
    },
    formatFiletypes = {
      css = 'prettier',
      javascript = 'eslint_d',
      javascriptreact = 'eslint_d',
      json = 'prettier',
      scss = 'prettier',
      less = 'prettier',
      typescript = 'eslint_d',
      typescriptreact = 'eslint_d',
      json = 'prettier',
      markdown = 'prettier',
    }
  }
}

-- LSP Saga config & keys https://github.com/glepnir/lspsaga.nvim
local saga = require "lspsaga"
saga.init_lsp_saga()

vim.api.nvim_set_keymap('n', 'ca', [[<cmd>lua require('lspsaga.codeaction').code_action()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'K', [[<cmd>lua require('lspsaga.hover').render_hover_doc()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'cr', [[<cmd>lua require('lspsaga.rename').rename()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'pd', [[<cmd>lua require'lspsaga.provider'.preview_definition()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'ch', [[<cmd>lua require('lspsaga.signaturehelp').signature_help()<CR>]], { noremap = true, silent = true })

-- scroll down hover doc or scroll in definition preview
-- vim.api.nvim_set_keymap('n', '<C-k>', [[<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>]], { noremap = true, silent = true })
-- scroll up hover doc
-- vim.api.nvim_set_keymap('n', '<C-Down>', [[<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>]], { noremap = true, silent = true })

-- Setup treesitter
local ts = require "nvim-treesitter.configs"
ts.setup {ensure_installed = "maintained", highlight = {enable = true}}

-- telescope
vim.api.nvim_set_keymap('n', 'ff', [[<cmd>lua require('telescope.builtin').find_files({previewer = false})<CR>]], { noremap = true, silent = true })
