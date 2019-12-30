set nocompatible 
set exrc
set noswapfile
set nobackup
set hlsearch
set encoding=utf-8
set tabstop=2
set shiftwidth=2
" set number
set number relativenumber
set nu rnu
set background=dark
syntax on


filetype off  
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'yggdroot/indentline'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'styled-components/vim-styled-components'
Plugin 'tpope/vim-fugitive'
Plugin 'sheerun/vim-polyglot'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'jiangmiao/auto-pairs'
Plugin 'tpope/vim-surround'
Plugin 'airblade/vim-gitgutter'
Plugin 'vim-airline/vim-airline'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'zivyangll/git-blame.vim'
Plugin 'dense-analysis/ale'
Plugin 'junegunn/fzf'
Plugin 'mattn/emmet-vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

colorscheme Blaaark

" LINT THING
let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚠️'
let b:ale_fixers = ['eslint', 'prettier']
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['eslint', 'prettier'],
\		'typescript': ['eslint', 'prettier'],
\}
" Fix files automatically on save
let g:ale_fix_on_save = 1
let b:ale_fix_on_save = 1

" NERDTREE
map <C-n> :NERDTreeToggle<CR>
map <C-r> :NERDTreeFind<CR>
let NERDTreeShowHidden=1

" FUZZY
nnoremap <C-p> :FZF<CR>

" COMMENT
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'

" CURSOR
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_start_word_key      = '<C-m>'
let g:multi_cursor_select_all_word_key = '<A-n>'
let g:multi_cursor_start_key           = 'g<C-m>'
let g:multi_cursor_select_all_key      = 'g<A-m>'
let g:multi_cursor_next_key            = '<C-m>'
let g:multi_cursor_prev_key            = '<C-p>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'
