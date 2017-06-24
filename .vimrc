set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'liuchengxu/space-vim-dark'
Plugin 'dfxyz/CandyPaper.vim'
Plugin 'nanotech/jellybeans.vim'
Plugin 'vim-scripts/burnttoast256'

" All of your Plugins must be added before the following line
call vundle#end()            " required
" https://vi.stackexchange.com/questions/10124/what-is-the-difference-between-filetype-plugin-indent-on-and-filetype-indent
filetype plugin indent on    " required
" end Vundle config here

" curated from https://dougblack.io/words/a-good-vimrc.html
syntax enable           " enable syntax processing

set tabstop=4           " number of visual spaces per TAB
set softtabstop=4       " number of spaces in tab when editing
set shiftwidth=4        " use 4 spaces when indenting
set expandtab           " tabs are spaces

set number              " show line numbers
set showcmd             " show command in bottom bar
set showmatch           " highlight matching [{()}] 

set incsearch           " search as characters are entered
set hlsearch            " highlight matches
" turn off search highlight
" nnoremap <leader><space> :nohlsearch<CR>
let mapleader=","       " leader is comma
nnoremap <silent> <leader><space> :noh<CR>

colorscheme burnttoast256
