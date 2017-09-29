" Goes in ~/.vim/ftplugin
" Largely sourced from
" https://realpython.com/blog/python/vim-and-python-a-match-made-in-heaven/

" Highlight > 80 chars
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/

" Encoding
set encoding=utf-8

" Indentation
set autoindent
set fileformat=unix

" python syntax checking and highlighting
let python_highlight_all=1

" use a better key combination for flake8
map <buffer> <leader>f :call Flake8()<CR>

" Flag extra whitespace
highlight BadWhitespace ctermbg=red guibg=darkred
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" python with virtualenv support
python3 << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF

