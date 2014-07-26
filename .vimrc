" General
set nocompatible                " use vim settings over vi | not sure if this is needed?
syntax enable                   " turn on syntax highlighting
set encoding=utf-8
set showcmd                     " bottom line will show information about command
filetype plugin indent on       " load file type plugins & indentation
set history=50                  " save 50 lines of history
set ruler                       " ruler
set number                      " show line numbers
syntax on
execute pathogen#infect()

" Whitespace
set nowrap                      " do not wrap lines
set tabstop=2 shiftwidth=2      " tab is two spaces
set expandtab                   " tabs are spaces
set backspace=indent,eol,start  " backspace through everything
set backspace=2

" Searching
set hlsearch                    " highlight matches when searching
set incsearch                   " incremental searching
set ignorecase                  " searches ignore case
set smartcase                   " unless the search contains 1+ capital letter

" Press Space to turn off highlighting and clear any message already
" displayed.
:nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

" Color
syntax enable
let g:solarized_termcolors=256
let g:solarized_termtrans=1
set background=dark
colorscheme solarized
