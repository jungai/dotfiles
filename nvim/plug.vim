  call plug#begin()

Plug 'tpope/vim-fugitive'
Plug 'cohama/lexima.vim'
Plug 'tomasiser/vim-code-dark'

if has("nvim")
	Plug 'neovim/nvim-lspconfig'
	Plug 'glepnir/lspsaga.nvim'
  Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
  Plug 'nvim-lua/completion-nvim'
	Plug 'editorconfig/editorconfig-vim'
  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'kyazdani42/nvim-web-devicons'
  Plug 'hoob3rt/lualine.nvim'
endif

call plug#end()

