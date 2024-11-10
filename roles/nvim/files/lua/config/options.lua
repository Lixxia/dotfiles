local opt = vim.opt

-- Status
opt.fillchars = { eob = " " }
opt.laststatus = 3
opt.showmode = true
opt.showcmd = false

-- Indenting
opt.expandtab = true
opt.smartindent = true
opt.autoindent = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4

-- Search
opt.ignorecase = true
opt.smartcase = true

-- Numbers
opt.ruler = false
opt.numberwidth = 2
opt.number = true
opt.relativenumber = false

-- Misc
opt.cmdheight = 1
opt.signcolumn = "yes"
opt.splitbelow = true
opt.splitright = true
opt.termguicolors = true
opt.wrap = false
opt.clipboard = "unnamedplus"
opt.cursorline = true
opt.mouse = "a"
opt.scrolloff = 5
opt.backspace = "indent,eol,start"
