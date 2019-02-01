" Set compatibility to Vim only.
set nocompatible

" Show cursor position
set ruler

" Turn on syntax highlighting.
syntax on

" Turn off modelines
set modelines=0

" Uncomment below to set the max textwidth. Use a value corresponding to the width of your screen.
" set textwidth=80
set formatoptions=tcqrn1
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set noshiftround

" Searching
set ignorecase
set smartcase
"set incsearch
"set hlsearch

" Display 5 lines above/below the cursor when scrolling with a mouse.
set scrolloff=5
" Fixes common backspace problems
set backspace=indent,eol,start

" Display options
set showmode
set showcmd
set cmdheight=1

" Appearance
let base16colorspace=256
set background=dark
colorscheme base16-gruvbox-dark
hi Normal guibg=none ctermbg=none                                                                   
hi LineNr guibg=none ctermbg=none

" Highlight matching pairs of brackets. Use the '%' character to jump between them.
set matchpairs+=<:>

" Line num
highlight LineNr ctermfg=black

" Statusline
let g:currentmode={
    \ 'n'  : 'Normal ',
    \ 'no' : 'N·Operator Pending ',
    \ 'v'  : 'Visual ',
    \ 'V'  : 'V·Line ',
    \ '' : 'V·Block ',
    \ 's'  : 'Select ',
    \ 'S'  : 'S·Line ',
    \ '^S' : 'S·Block ',
    \ 'i'  : 'Insert ',
    \ 'R'  : 'Replace ',
    \ 'Rv' : 'V·Replace ',
    \ 'c'  : 'Command ',
    \ 'cv' : 'Vim Ex ',
    \ 'ce' : 'Ex ',
    \ 'r'  : 'Prompt ',
    \ 'rm' : 'More ',
    \ 'r?' : 'Confirm ',
    \ '!'  : 'Shell ',
    \ 't'  : 'Terminal '
    \}

" Automatically change the statusline color depending on mode
function! ChangeStatuslineColor()
  if (mode() =~# '\v(n|no)')
    exe 'hi! StatusLine ctermfg=000 ctermbg=008'
  elseif (mode() =~# '\v(v|V)' || g:currentmode[mode()] ==# 'V·Block' || get(g:currentmode, mode(), '') ==# 't')
    exe 'hi! StatusLine ctermbg=003 ctermfg=000'
  elseif (mode() ==# 'i')
    exe 'hi! StatusLine ctermbg=004 ctermfg=000'
  elseif (mode() ==# 'R')
    exe 'hi! StatusLine ctermbg=001 ctermfg=000'
  else
    exe 'hi! StatusLine ctermfg=000 ctermbg=008'
  endif

  return ''
endfunction

function! ReadOnly()
  if &readonly || !&modifiable
    return ''
  else
    return ''
endfunction

" Set status line display
set laststatus=2
hi StatusLine ctermfg=000 ctermbg=008 cterm=NONE
hi StatusLineNC ctermfg=black ctermbg=000 cterm=NONE
set statusline+=%{ChangeStatuslineColor()}               " Changing the statusline color
set statusline+=%0*\ %{toupper(g:currentmode[mode()])}   " Current mode
set statusline+=%{&paste?'PASTE':''}\                     " Paste warning
set statusline+=%2*\ %<%f\ %{ReadOnly()}\ %m\ %w\        " File+path
set statusline+=%1*\ %=                                  " Space/switch right
set statusline+=%2*\ %Y\                                 " FileType
set statusline+=%2*\ %{(&fenc!=''?&fenc:&enc)}\ %{&ff}\  " Encoding & Fileformat
set statusline+=%3*\ %3p%%\                              " Percent file
set statusline+=%0*\ %l:%c\                              " Rownumber/total (%)

hi User1 ctermfg=007
hi User2 ctermfg=008
hi User3 ctermfg=008 ctermbg=019

set noshowmode
set noswapfile
" Encoding
set encoding=utf-8
