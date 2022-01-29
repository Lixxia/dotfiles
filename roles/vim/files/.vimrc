"       (_)                   
" __   ___ _ __ ___  _ __ ___ 
" \ \ / / | '_ ` _ \| '__/ __|
"  \ V /| | | | | | | | | (__ 
"   \_/ |_|_| |_| |_|_|  \___|

if empty (glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'Lixxia/gruvbox'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
Plug 'lambdalisue/glyph-palette.vim'
Plug 'tpope/vim-commentary'
Plug 'airblade/vim-gitgutter'
Plug 'hashivim/vim-terraform'
Plug 'towolf/vim-helm'
Plug 'raimondi/delimitMate'
Plug 'ap/vim-css-color'
call plug#end()

" Setup statusline
source ~/.vim/statusline.vim

" Comments
nmap <C-_> <Plug>CommentaryLine
vmap <C-_> <Plug>Commentary

" Turn on syntax highlighting 
syntax on

" Extra nerdtree settings
source ~/.vim/nerdtree.vim

set wildmenu

" Swaps
set dir=~/.vimswap,/tmp,.

" Set compatibility to Vim only.
set nocompatible

" Show cursor position
set ruler

" Turn off modelines
set modelines=0

set formatoptions=tcqrn1
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set noshiftround
set autoindent
set smarttab

" Searching
set ignorecase
set smartcase

" Display 5 lines above/below the cursor when scrolling with a mouse.
set scrolloff=5
" Fixes common backspace problems
set backspace=indent,eol,start

" Display options
set showmode
set showcmd
set cmdheight=1

" Appearance
silent! colorscheme gruvbox
let g:gruvbox_contrast_dark='hard'
let base16colorspace=256
set background=dark

hi clear SignColumn
hi Normal ctermbg=NONE guibg=NONE

hi LineNr          ctermfg=019   ctermbg=NONE guibg=NONE
hi CursorLineNr    ctermfg=white ctermbg=NONE guibg=NONE

hi GitGutterAdd    ctermfg=2 ctermbg=NONE guibg=NONE
hi GitGutterChange ctermfg=3 ctermbg=NONE guibg=NONE
hi GitGutterDelete ctermfg=1 ctermbg=NONE guibg=NONE

" Fix splitter statusline
hi StatusLine cterm=italic ctermbg=NONE ctermfg=019
hi StatusLineNC cterm=bold ctermbg=NONE ctermfg=019

set fillchars+=vert:\▏

" Highlight matching pairs of brackets. Use the '%' character to jump between them.
set matchpairs+=<:>

" Encoding
set encoding=utf-8

" Yaml tabs
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
