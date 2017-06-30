" vundle {{{
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
" }}}

" curated from https://dougblack.io/words/a-good-vimrc.html
" colors {{{
syntax enable           " enable syntax processing
colorscheme burnttoast256
" }}}

" tabs and spaces {{{
set tabstop=4           " number of visual spaces per TAB
set softtabstop=4       " number of spaces in tab when editing
set shiftwidth=4        " use 4 spaces when indenting
set expandtab           " tabs are spaces
" }}}

" ui config {{{
set number              " show line numbers
set showcmd             " show command in bottom bar
set showmatch           " highlight matching [{()}] 
" }}}

" searching {{{
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
" turn off search highlight
" nnoremap <leader><space> :nohlsearch<CR>
nnoremap <silent> <leader><space> :noh<CR>
" }}}

" folding {{{
set foldenable          " enable folding
set foldlevelstart=100  " open most folds by default
" space open/closes folds
nnoremap <space> za
set foldmethod=indent   " fold based on indent level
" }}}

" movement {{{
" move vertically by visual line
nnoremap j gj
nnoremap k gk

" move to beginning/end of line
nnoremap B ^
nnoremap E $

" $/^ doesn't do anything
nnoremap $ <nop>
nnoremap ^ <nop>
" }}}

" leader shortcuts {{{
let mapleader=","       " leader is comma
" jk is escape
inoremap jk <esc>
" }}}

set modelines=1
" vim:foldmethod=marker:foldlevel=0