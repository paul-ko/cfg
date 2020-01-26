" vundle
set nocompatible              " be iMproved, required
filetype off                  " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'dracula/vim'
Plugin 'mileszs/ack.vim'
" Python auto-indentation
Plugin 'vim-scripts/indentpython.vim'
" Autocomplete
" Disabled due to crashiness.
" Bundle 'Valloric/YouCompleteMe'
" Python syntax check on save
Plugin 'scrooloose/syntastic'
" Status bar
Plugin 'vim-airline/vim-airline'
" Show git status in the gutter
Plugin 'airblade/vim-gitgutter'
" PEP8 checking
Plugin 'nvie/vim-flake8'
" File browser
Plugin 'scrooloose/nerdtree'
" Detailed status bar
" Disabled due to large number of dependencies
" Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" largely curated from 
" https://dougblack.io/words/a-good-vimrc.html

" colors
syntax enable           " enable syntax processing
colorscheme dracula

" tabs and spaces
set tabstop=4           " number of visual spaces per TAB
set softtabstop=4       " number of spaces in tab when editing
set shiftwidth=4        " use 4 spaces when indenting
set expandtab           " tabs are spaces

" ui config
set number              " show line numbers
set showcmd             " show command in bottom bar
set showmatch           " highlight matching [{()}] 

" leader shortcuts
let mapleader=","       " leader is comma
" jk is escape
inoremap jk <esc>
" open ack.vim
nnoremap <leader>a :Ack! 

" searching
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
" use smartcase search
set ignorecase
set smartcase
" turn off search highlight
nnoremap <silent> <leader><space> :noh<CR>

" folding
set foldenable          " enable folding
set foldlevelstart=100  " open most folds by default
" space open/closes folds
nnoremap <space> za
set foldmethod=indent   " fold based on indent level

" movement
" move vertically by visual line
nnoremap j gj
nnoremap k gk

" split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Recommended syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_wq = 0
