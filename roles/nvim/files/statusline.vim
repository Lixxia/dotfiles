" set colors for statusline based on mode
function! ModeColors(mode) " {{{
  " Normal mode
  if a:mode == 'n'
    hi fgc guifg=#6E6C7E guibg=#c3bac6
    hi powerline guifg=#c3bac6
  " Insert mode
  elseif a:mode == 'i'
    hi fgc guifg=#6E6C7E guibg=#A4B9EF
    hi powerline guifg=#A4B9EF
  " Replace mode
  elseif a:mode == 'R'
    hi fgc guifg=#6E6C7E guibg=#E38C8F
    hi powerline guifg=#E38C8F
  " Visual mode
  elseif a:mode == 'v' || a:mode == 'V' || a:mode == ""
    hi fgc guifg=#6E6C7E guibg=#EBDDAA
    hi powerline guifg=#EBDDAA
  " Command mode
  elseif a:mode == 'c'
    hi fgc guifg=#6E6C7E guibg=#C6AAE8
    hi powerline guifg=#C6AAE8
  " Terminal mode
  elseif a:mode == 't'
    hi fgc guifg=#6E6C7E guibg=007
    hi powerline guifg=007
  endif

  hi powerline_b guifg=#575268 guibg=NONE guisp=NONE gui=NONE gui=NONE
  hi fgc_b guifg=#c3bac6 guibg=#575268

  " Return empty string so as not to display anything in the statusline
  return ''
endfunction

" Return a nice mode name
function! ModeName(mode)
  if a:mode == 'n'
    return 'NORMAL'
  " Insert mode
  elseif a:mode == 'i'
    return 'INSERT'
  " Replace mode
  elseif a:mode == 'R'
    return 'REPLACE'
  " Visual mode
  elseif a:mode == 'v'
    return 'VISUAL'
  elseif a:mode == 'V'
    return "V-LINE"
  elseif a:mode == ""
    return "V-BLOCK"
  " Command mode
  elseif a:mode == 'c'
    return 'COMMAND'
  " Terminal mode
  elseif a:mode == 't'
    return 'TERMINAL'
  endif
endfunction

hi modified_powerline_b guifg=#6E6C7E guibg=#E38C8F
hi modified_fgc guifg=#6E6C7E guibg=#E38C8F
function! Modified(modified)
  if a:modified == 1
    hi modified_powerline_b guifg=#6E6C7E guibg=NONE
    hi modified_fgc guifg=#6E6C7E guibg=#E38C8F
  else
    hi modified_powerline_b guifg=#6E6C7E guibg=NONE
    hi modified_fgc guifg=#E38C8F guibg=#6E6C7E
  endif
  return '●'
endfunction

function! ReadOnly()
  if &readonly || !&modifiable
    hi modified_powerline_b guifg=#575268 guibg=NONE
    hi modified_fgc guifg=#c3bac6 guibg=#575268
    return ''
  else
    hi modified_powerline_b guifg=#575268 guibg=NONE
    hi modified_fgc guifg=#E38C8F guibg=#575268
    return ''
endfunction

function! BufNum()
  return len(filter(range(1, bufnr('$')), 'buflisted(v:val)'))
endfunction

set noshowmode
set laststatus=2
set statusline=

" Update Colors
set statusline+=%{ModeColors(mode())}

" Mode
set statusline+=%#powerline#%#fgc#%{ModeName(mode())}%#powerline#
set statusline+=\ 

" Filename
set statusline+=%#powerline_b#%#fgc_b#%.20f%#powerline_b#
set statusline+=\ 

" Right Side
set statusline+=%=

" Modified 
set statusline+=%#modified_powerline_b#%#modified_fgc#%{ReadOnly()}%#modified_powerline_b#
set statusline+=\ 

" File Percent
set statusline+=%#powerline_b#%#fgc_b#%3p%%%#powerline_b#
set statusline+=\ 

" Cursor Position
set statusline+=%#powerline#%#fgc#%l:%c%#powerline#
