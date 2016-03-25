" General
set nocompatible                " use vim settings over vi
syntax enable                   " turn on syntax highlighting
syntax on
set encoding=utf-8
set showcmd                     " bottom line will show information about command
filetype plugin indent on       " load file type plugins & indentation
set history=50                  " save 50 lines of history
set ruler                       " ruler
set number                      " show line numbers
set cursorline                  " highlight current line
set wildmenu                    " visual autocomplete for command menu
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
set background=dark
colorscheme Tomorrow-Night-Bright

" Highlight whitespace
highlight LiteralTabs ctermbg=darkgreen guibg=darkgreen
match LiteralTabs /\s\  /
highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
match ExtraWhitespace /\s\+$/
