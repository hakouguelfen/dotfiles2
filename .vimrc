let mapleader=" "

if has('termguicolors')
  set termguicolors
endif
colorscheme onedark

syntax on
filetype plugin indent on

set nocompatible
set number relativenumber
set ignorecase
set smartcase 
set expandtab 
set smarttab
set wrap
set tabstop=2
set shiftwidth=2
set softtabstop=-1
set incsearch
set clipboard+=unnamedplus
set wildmode=longest,list,full
set scrolloff=4

" toggle cursor [Normal/Insert] mode
let &t_SI="\e[6 q"
let &t_EI="\e[2 q"

set laststatus=2

" Keybindings
map <leader>bs :w <CR>
inoremap jk <Esc>
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

"keep text selected when clicking on < for indenting
vnoremap < <gv 
vnoremap > >gv

