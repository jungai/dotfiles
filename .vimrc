set hlsearch
set encoding=utf-8
set tabstop=2
set shiftwidth=2
set number 
set incsearch
set nu 
set noswapfile
set nowrap
set smartindent
set expandtab
set hidden
syntax on

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'mxw/vim-jsx'
Plugin 'leafgarland/typescript-vim'
Plugin 'valloric/youcompleteme'
Plugin 'sickill/vim-monokai'
Plugin 'tomasr/molokai'
Plugin 'scrooloose/nerdtree'
Plugin 'junegunn/fzf'
Plugin 'jiangmiao/auto-pairs'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'tpope/vim-surround'
Plugin 'zivyangll/git-blame.vim'
Plugin 'prettier/vim-prettier'
Plugin 'scrooloose/syntastic'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on

let mapleader = " "

" YCM

nnoremap <leader>gd :YcmCompleter GoTo<CR>
nnoremap <leader>gr :YcmCompleter GoToReferences<CR>
nnoremap <leader>rr :YcmCompleter RefactorRename<CR>
nnoremap <leader>gt :YcmCompleter GetType<CR>


colorscheme molokai
set background=dark

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" NERDTREE
map <leader>n :NERDTreeToggle<CR>
map <leader>r :NERDTreeFind<CR>
let NERDTreeShowHidden=1

" FUZZY
nnoremap <leader>p :FZF<CR>

" Molokai
let g:molokai_original = 1
" let g:rehash256 = 1

