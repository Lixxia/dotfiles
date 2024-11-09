" barbar config 
" =============

" Move to previous/next
nnoremap <silent>    <A-,> <Cmd>BufferPrevious<CR>
nnoremap <silent>    <A-.> <Cmd>BufferNext<CR>

let g:barbar_auto_setup = v:false " disable auto-setup
lua << EOF
  require'barbar'.setup {
      auto_hide = 1,
  }
EOF

" nvimtree config
" ===============

let g:nvim_tree_icons = {
    \ 'default': '',
    \ 'symlink': '',
    \ 'git': {
    \   'unstaged': "",
    \   'staged': "✓",
    \   'unmerged': "",
    \   'renamed': "",
    \   'untracked': "",
    \   'deleted': "",
    \   'ignored': ""
    \   },
    \ 'folder': {
    \   'arrow_open': "",
    \   'arrow_closed': "",
    \   'default': "",
    \   'open': "",
    \   'empty': "",
    \   'empty_open': "",
    \   'symlink': "",
    \   'symlink_open': "",
    \   }
    \ }

nnoremap <C-n> :NvimTreeToggle<CR>
nnoremap <leader>r :NvimTreeRefresh<CR>
nnoremap <leader>n :NvimTreeFindFile<CR>

hi NvimTreeVertSplit guifg=#1E1E28 guibg=NONE
hi NvimTreeStatusLineNC guibg=NONE
hi NvimTreeStatusLine guibg=NONE

lua << EOF
require'nvim-tree'.setup {
  hijack_cursor       = false,
  diagnostics = {
    enable = false,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    }
  },
  renderer = {
    root_folder_label = false,
  },
  update_focused_file = {
    enable      = false,
    update_cwd  = false,
    ignore_list = {}
  },
  filters = {
    dotfiles = false,
    custom = {}
  },
  git = {
    enable = true,
    ignore = true,
    timeout = 500,
  },
  actions = {
    open_file = {
      resize_window = false
    }
  },
  view = {
    width = 30,
    side = 'left',
    number = false,
    relativenumber = false,
    signcolumn = "yes"
  },
  trash = {
    cmd = "trash",
    require_confirm = true
  }
}

vim.g.nvim_tree_indent_markers = 1

require('nvim-tree.api').events.subscribe("TreeOpen", function ()
     vim.wo.statusline = ' '
end)
EOF

" telescope config
" ================

lua << EOF
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
EOF

" gitsigns config
" ===============

hi GitGutterAdd    guifg=2 guibg=NONE
hi GitGutterChange guifg=3 guibg=NONE
hi GitGutterDelete guifg=1 guibg=NONE

lua << EOF
require('gitsigns').setup {
  signs = {
    add          = {text = '┃'},
    change       = {text = '┃'},
    delete       = {text = '_'},
    topdelete    = {text = '‾'},
    changedelete = {text = '~'},
  }
}
EOF

" nvim-lint config
" ================
lua << EOF
require('lint').linters_by_ft = {
  bash = {'ShellCheck'},
  python = {'pylint'},
  ['yaml.ansible'] = {'ansible_lint'},
  yaml = {'yamllint'},
  tf = {'tflint'},
}
EOF

au BufWritePost * lua require('lint').try_lint()
