let mapleader=" "

if has('termguicolors')
  set termguicolors
endif
colorscheme onedark

syntax on
filetype plugin indent on

set nocompatible
set number relativenumber
set cursorline

set ignorecase
set smartcase 
set incsearch

set autoindent
set smartindent

set expandtab 
set smarttab
set wrap
set tabstop=2
set shiftwidth=2
set softtabstop=-1
set scrolloff=4

set clipboard+=unnamedplus
set wildmode=longest,list,full
set path+=**
set wildmenu

" auto completion mechanism
set complete+=kspell
set completeopt=menuone,longest
set shortmess+=c
"autocmd FileType python set omnifunc=python3complete#Complete

" Folding mechanism
set fillchars=fold:\
set foldmethod=indent
set foldlevel=99
set nofoldenable

set laststatus=2

" toggle cursor [Normal/Insert] mode
let &t_SI="\e[6 q"
let &t_EI="\e[2 q"

""""""""""""""""""" KEYBINDINGS ''''''''''''''''''''''''
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! CleverTab()
  if strpart( getline('.'), 0, col('.')-1 ) =~ '^\s*$'
    return "\<Tab>"
  else
    return "\<C-N>"
  endif
endfunction
inoremap <Tab> <C-R>=CleverTab()<CR>

map <leader>op :Lex<CR> :vertical resize 30<CR>
map <leader>bs :w <CR>
map <leader>bk :bdelete <CR>
map <leader>bb :ls<CR>:buffer<Space>
map <leader>ff :find<Space>
map gt :bNext <CR>
map gT :bprevious <CR>

"for spliting purposes
nnoremap <leader>w <C-w>

"For insert mode
inoremap jk <Esc>
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O
"pressing enter to select from menu
inoremap <expr> <CR> pumvisible() ? "<C-y>" :"<CR>" 


"For visual mode
"keep text selected when clicking on < for indenting
vnoremap < <gv 
vnoremap > >gv

