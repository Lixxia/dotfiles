" set colors for statusline based on mode
function! ModeColors(mode) " {{{
  " Normal mode
  if a:mode == 'n'
    hi fgc ctermfg=000 ctermbg=017
    hi powerline ctermfg=017
  " Insert mode
  elseif a:mode == 'i'
    hi fgc ctermfg=000 ctermbg=004
    hi powerline ctermfg=004
  " Replace mode
  elseif a:mode == 'R'
    hi fgc ctermfg=000 ctermbg=001
    hi powerline ctermfg=001
  " Visual mode
  elseif a:mode == 'v' || a:mode == 'V' || a:mode == ""
    hi fgc ctermfg=000 ctermbg=003
    hi powerline ctermfg=003
  " Command mode
  elseif a:mode == 'c'
    hi fgc ctermfg=000 ctermbg=005
    hi powerline ctermfg=005
  " Terminal mode
  elseif a:mode == 't'
    hi fgc ctermfg=000 ctermbg=007
    hi powerline ctermfg=007
  endif

  hi powerline_b ctermfg=018 ctermbg=NONE guisp=NONE gui=NONE cterm=NONE
  hi fgc_b ctermfg=017 ctermbg=018

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

hi modified_powerline_b ctermfg=000 ctermbg=001
hi modified_fgc ctermfg=000 ctermbg=001
function! Modified(modified)
  if a:modified == 1
    hi modified_powerline_b ctermfg=000 ctermbg=NONE
    hi modified_fgc ctermfg=000 ctermbg=001
  else
    hi modified_powerline_b ctermfg=019 ctermbg=NONE
    hi modified_fgc ctermfg=001 ctermbg=019
  endif
  return '●'
endfunction

function! ReadOnly()
  if &readonly || !&modifiable
    hi modified_powerline_b ctermfg=018 ctermbg=NONE
    hi modified_fgc ctermfg=017 ctermbg=018
    return ''
  else
    hi modified_powerline_b ctermfg=018 ctermbg=NONE
    hi modified_fgc ctermfg=001 ctermbg=018
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
