set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'itchyny/lightline.vim'
Plugin 'chriskempson/base16-vim'

Bundle 'daviesjamie/vim-base16-lightline'
"Bundle 'scrooloose/syntastic'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"" Syntastic Settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Disable vi compatibility.
set nocompatible

" Tab width.
set tabstop=2

" Tab width when editing.
set softtabstop=2

" Tab width when indenting in normal mode.
set shiftwidth=2

" Emit spaces instead of tabs.
set expandtab

" Automatically indent on newline.
set autoindent

" Command history.
set history=1000

" Ignore character case when searching.
set ignorecase

"" UI

" Show line numbers.
set number

" Show cursor position.
set ruler

" Show current command.
set showcmd

" Show colored column.
set colorcolumn=80

" Highlight current line.
set cursorline

" Highlight matching brackets.
set showmatch

" Highlight search matches.
set hlsearch

" Always show status line.
set laststatus=2

" Enable syntax highlighting.
syntax on

let base16colorspace=256

" Set colorscheme.
set background=dark
colorscheme base16-default 

" Background fix for colorscheme
hi Normal guibg=none ctermbg=none
hi LineNr guibg=none ctermbg=none
" hi SignColumn guibg=none ctermbg=none

"" Input

" Set leader key.
let mapleader=' '
nnoremap <space> <nop>

" Escape key replacement in insert mode.
inoremap jk <esc>

" Treat overflowing lines as having line breaks.
map j gj
map k gk

" Simplify saving files.
map <C-s> :w<CR>

" Disable search match highlighting.
map <leader>h :nohlsearch<CR>

" Time waited for a mapped key sequence to complete.
set timeoutlen=300

" Enable mouse usage.
"set mouse=a

"" File

" Disable swapfiles.
set noswapfile

"" Lightline

let g:lightline={
 \ 'colorscheme': 'base16',
 \ }
