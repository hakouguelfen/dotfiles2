function! CleverTab()
  if strpart( getline('.'), 0, col('.')-1 ) =~ '^\s*$'
    return "\<Tab>"
  else
    return "\<C-N>"
  endif
endfunction
inoremap <Tab> <C-R>=CleverTab()<CR>

map <leader>rr :so%<CR>
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
"pressing enter to select from menu
inoremap <expr> <CR> pumvisible() ? "<C-y>" :"<CR>" 

"For visual mode
"keep text selected when clicking on < for indenting
vnoremap < <gv 
vnoremap > >gv

nnoremap <leader>f :call fzf#run({'source': 'git ls-files', 'sink': 'edit', 'options': '--preview "bat --color=always {}"'})<CR>
""nnoremap <leader>f :call fzf#run({'source': 'fd', 'sink': 'edit', 'options': '--preview "bat --color=always {}"'})<CR>
nnoremap <leader>g :call fzf#run({'source': 'rg .', 'sink': 'edit'})<CR>
