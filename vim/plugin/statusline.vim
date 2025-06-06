highlight ModeInsert  ctermbg=67  ctermfg=16 cterm=bold
highlight ModeNormal  ctermbg=71  ctermfg=16 cterm=bold
highlight ModeCommand ctermbg=179 ctermfg=16 cterm=bold
highlight ModeReplace ctermbg=167 ctermfg=16 cterm=bold
highlight ModeVisual  ctermbg=104 ctermfg=16 cterm=bold
highlight ModeOther   ctermbg=244 ctermfg=16 cterm=bold

let g:mode_info = {
\ 'n': {'name': 'NORMAL', 'color': 'ModeNormal'},
\ 'i': {'name': 'INSERT', 'color': 'ModeInsert'},
\ 'v': {'name': 'VISUAL', 'color': 'ModeVisual'},
\ 'V': {'name': 'VISUAL LINE', 'color': 'ModeVisual'},
\ "\<C-v>": {'name': 'VISUAL BLOCK', 'color': 'ModeVisual'},
\ 'c': {'name': 'COMMAND', 'color': 'ModeCommand'},
\ 'R': {'name': 'REPLACE', 'color': 'ModeReplace'}
\ }

function! Mode()
  let l:mode = mode()
  let l:info = get(g:mode_info, l:mode, {'name':'UNKNOWN', 'color':'ModeOther'})
  return printf("%%#%s# %s %%*", l:info.color, l:info.name)
endfunction

function! MyStatusLine()
  let l:mode_part = Mode()
  let l:file_part = ' %F%#ErrorMsg#%m'
  let l:right_part = '%=%y %P %l:%c'
  return l:mode_part . '%#Normal#' . l:file_part . '%#Normal#' . l:right_part
endfunction

set laststatus=2
set statusline=%!MyStatusLine()
set cmdheight=1
set noshowmode
