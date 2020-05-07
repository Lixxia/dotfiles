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
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'tpope/vim-commentary'
Plug 'airblade/vim-gitgutter'
Plug 'hashivim/vim-terraform'
Plug 'towolf/vim-helm'
Plug 'raimondi/delimitMate'
call plug#end()

source ~/.vim/statusline.vim

" Comments
nmap <C-_> <Plug>CommentaryLine
vmap <C-_> <Plug>Commentary

" Nerdtree
nmap <C-n> :NERDTreeToggle<CR>

let g:NERDTreeShowHidden=1
let g:NERDTreeLimitedSyntax = 1
let g:NERDTreeHighlightCursorline = 0
let g:NERDTreeMinimalUI = v:true

let g:WebDevIconsUnicodeDecorateFolderNodes = 1

let g:WebDevIconsUnicodeDecorateFolderNodesDefaultSymbol = ''

let g:NERDTreeDirArrowExpandable = ''
let g:NERDTreeDirArrowCollapsible = ''

" Autoclose if nerdtree is alone
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Git status icons
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "",
    \ "Staged"    : "✚",
    \ "Untracked" : "",
    \ "Renamed"   : "",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "",
    \ "Dirty"     : "",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : "",
    \ "Unknown"   : "?"
    \ }

" Turn on syntax highlighting.
syntax on

augroup nerdtreesettings
	autocmd!

    " Set common options.
    autocmd FileType nerdtree
    	\ setlocal
    		\ nolist
    		\ nocursorline
    		\ signcolumn=no
    		\ conceallevel=3 concealcursor=nvic
    
    " Hide current working directory line.
    autocmd FileType nerdtree syntax match NERDTreeHideCWD #^[</].*$# conceal
    
    " Hide slashes after each directory node.
    autocmd FileType nerdtree syntax match NERDTreeDirSlash #/$# conceal containedin=NERDTreeDir contained
augroup end

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
colorscheme gruvbox
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

" Highlight matching pairs of brackets. Use the '%' character to jump between them.
set matchpairs+=<:>

" Encoding
set encoding=utf-8

