let g:netrw_banner = 0       "" Hide the banner for a cleaner look
let g:netrw_liststyle = 3    "" Use tree view (hierarchical directory listing)
let g:netrw_browse_split = 4 "" Open files in the previous window
let g:netrw_altv = 1         "" Open splits to the right
let g:netrw_winsize = 20     "" Set the width of the netrw window (25% of the screen)
let g:netrw_preview = 1      "" Open previews in a vertical split

autocmd FileType netrw nmap <buffer> <Tab> <CR>
map <leader>op :Lex<CR>

