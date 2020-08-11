" Nerdtree
nmap <C-n> :NERDTreeToggle<CR>

let g:NERDTreeShowHidden=1
let g:NERDTreeIgnore=['\.git$']

let g:NERDTreeHighlightCursorline = 0
let g:NERDTreeMinimalUI = v:true

let g:WebDevIconsUnicodeDecorateFolderNodes = 1

let g:WebDevIconsUnicodeDecorateFolderNodesDefaultSymbol = ''

let g:NERDTreeDirArrowExpandable = ''
let g:NERDTreeDirArrowCollapsible = ''

let g:NERDTreeStatusline = "%#powerline#%#fgc#%{exists('b:NERDTree')?b:NERDTree.root.path.str():''}%#powerline#"

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
     autocmd FileType nerdtree call glyph_palette#apply()

 augroup end
