" set colors for statusline based on mode
function! ModeColors(mode) " {{{
  " Normal mode
  if a:mode == 'n'
    hi fgc guifg=#161320 guibg=#F8BD96
    hi powerline guifg=#F8BD96
  " Insert mode
  elseif a:mode == 'i'
    hi fgc guifg=#161320 guibg=#A4B9EF
    hi powerline guifg=#A4B9EF
  " Replace mode
  elseif a:mode == 'R'
    hi fgc guifg=#161320 guibg=#E38C8F
    hi powerline guifg=#E38C8F
  " Visual mode
  elseif a:mode == 'v' || a:mode == 'V' || a:mode == ""
    hi fgc guifg=#161320 guibg=#DDB6F2
    hi powerline guifg=#DDB6F2
  " Command mode
  elseif a:mode == 'c'
    hi fgc guifg=#161320 guibg=#ABE9B3
    hi powerline guifg=#ABE9B3
  " Terminal mode
  elseif a:mode == 't'
    hi fgc guifg=#161320 guibg=#F2CDCD
    hi powerline guifg=#F2CDCD
  endif

  hi powerline_b guifg=#575268 guibg=NONE guisp=NONE gui=NONE gui=NONE
  hi fgc_b guifg=#c3bac6 guibg=#575268

  " Return empty string so as not to display anything in the statusline
  return ''
endfunction

" Return a nice mode name
function! ModeIcon(mode)
  " Normal mode
  if a:mode == 'n'
    return '煮'
  " Insert mode
  elseif a:mode == 'i'
    return ' '
  " Replace mode
  elseif a:mode == 'R'
    return ' '
  " Visual mode
  elseif a:mode == 'v'
    return ' '
  elseif a:mode == 'V'
    return " "
  elseif a:mode == ""
    return "礪"
  " Command mode
  elseif a:mode == 'c'
    return '⌘ '
  " Terminal mode
  elseif a:mode == 't'
    return ' '
  endif
endfunction

function! Modified(modified)
  if a:modified == 1
    hi modified_powerline_b guifg=#E38C8F guibg=NONE
    hi modified_fgc guifg=#161320 guibg=#E38C8F
    return '●'
  else
    return ''
  endif
endfunction

function! GitBranch()
    hi gitbranch_powerline_b guifg=#89DCEB guibg=NONE
    hi gitbranch_fgc guifg=#161320 guibg=#89DCEB
    return ' ' . gitbranch#name()
endfunction

function! ReadOnly()
  if &readonly || !&modifiable
    hi ro_powerline_b guifg=#575268 guibg=NONE
    hi ro_fgc guifg=#c3bac6 guibg=#575268
    return ''
  else
    hi ro_powerline_b guifg=#575268 guibg=NONE
    hi ro_fgc guifg=#E38C8F guibg=#575268
    return ''
endfunction

function! ShiftWidth()
    let fname = expand('%:t')
    if ! &expandtab || fname == 'ControlP'
        return '-'
    endif
    if &shiftwidth == 0
        return &tabstop
    else
        return &shiftwidth
    endif
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
set statusline+=%#powerline#%#fgc#%{ModeIcon(mode())}%#powerline#
set statusline+=\ 

" Filename
set statusline+=%#powerline_b#%#fgc_b#%.20f%#powerline_b#
set statusline+=\ 

" Modified
set statusline+=%#modified_powerline_b#%{&modified==1?'':''}%#modified_fgc#%{Modified(&modified)}%#modified_powerline_b#%{&modified==1?'':''}
set statusline+=\ 

" Right Side
set statusline+=%=

" Git
set statusline+=%#gitbranch_powerline_b#%#gitbranch_fgc#%{GitBranch()}%#gitbranch_powerline_b#
set statusline+=\ 

" Read Only
set statusline+=%#ro_powerline_b#%{&readonly==1?'':''}%#ro_fgc#%{ReadOnly()}%#ro_powerline_b#%{&readonly==1?'':''}
set statusline+=\ 

" Tab Length
set statusline+=%#powerline_b#%#fgc_b#\ \ %{ShiftWidth()}%#powerline_b#
set statusline+=\ 

" File Percent
" set statusline+=%#powerline_b#%#fgc_b#%3p%%%#powerline_b#
" set statusline+=\ 

" Cursor Position
set statusline+=%#powerline#%#fgc#\ %l\/\%L%#powerline#
