"       (_)                   
" __   ___ _ __ ___  _ __ ___ 
" \ \ / / | '_ ` _ \| '__/ __|
"  \ V /| | | | | | | | | (__ 
"   \_/ |_|_| |_| |_|_|  \___|

call plug#begin('~/.config/nvim/plugged')
Plug 'catppuccin/nvim', {'as': 'catppuccin'}
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'tpope/vim-commentary'
Plug 'airblade/vim-gitgutter'
Plug 'hashivim/vim-terraform'
Plug 'towolf/vim-helm'
Plug 'raimondi/delimitMate'
Plug 'ap/vim-css-color'
Plug 'fatih/vim-go'
Plug 'itchyny/vim-gitbranch'
Plug 'tsandall/vim-rego'
call plug#end()

" Setup statusline
source ~/.config/nvim/statusline.vim

" Setup catppuccin colorscheme
source ~/.config/nvim/catppuccin.vim

" Extra tree settings
source ~/.config/nvim/nvimtree.vim

" Turn on syntax highlighting 
syntax on

" Comments
nmap <C-_> <Plug>CommentaryLine
vmap <C-_> <Plug>Commentary

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
let base16colorspace=256
set background=dark

hi clear SignColumn
hi Normal guibg=NONE guibg=NONE

hi LineNr          guifg=019   guibg=NONE
hi CursorLineNr    guifg=white guibg=NONE

hi GitGutterAdd    guifg=2 guibg=NONE
hi GitGutterChange guifg=3 guibg=NONE
hi GitGutterDelete guifg=1 guibg=NONE

" Fix splitter statusline
hi StatusLine gui=italic guibg=NONE guifg=019
hi StatusLineNC gui=bold guibg=NONE guifg=019

set fillchars+=vert:\▏

" Highlight matching pairs of brackets. Use the '%' character to jump between them.
set matchpairs+=<:>

" Encoding
set encoding=utf-8

" Yaml tabs
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
