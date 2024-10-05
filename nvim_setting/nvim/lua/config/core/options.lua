vim.cmd("let g:netrw_liststyle = 3")

local opt = vim.opt

opt.relativenumber = true
opt.number = true

-- tab and indentation
opt.tabstop = 2 -- 2 spaces for tabs
opt.shiftwidth = 2 -- 2 spaces for indent width
opt.expandtab = true -- expand tab to spaces
opt.autoindent = true -- copy indent from current line to the new line when start a new one

opt.wrap = false -- line wrap

-- search
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- if you includ mixed case in search, assumes you want case-sensitive

opt.cursorline = true

-- turm on termguicolors for tokyonight colorscheme to work. must have to use true color terminal
opt.termguicolors = true
opt.background = "dark" -- background can be "light" or "dark"
opt.signcolumn = "yes" -- show sign column so that text doesn't shift

-- backspace
opt.backspace = "indent,eol,start" -- allow backspace for indent, end of line or insert mode start position

-- clipboard
opt.clipboard:append("unnamedplus") -- use system clipboard as default register

-- split windows
opt.splitright = true -- split vertical windown default to the right
opt.splitbelow = true -- split horizontal window default to the bottom

opt.showtabline = 1

--[=[
vim.g.encoding = "UTF-8"
vim.o.fileencoding = 'utf-8'

vim.o.scrolloff = 8
vim.o.sidescrolloff = 8

vim.wo.number = true
vim.wo.relativenumber = true

--vim.wo.cursorline = true

vim.wo.signcolumn = "yes"

vim.o.tabstop = 2
vim.bo.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftround = true

vim.o.expandtab = true
vim.bo.expandtab = true

vim.o.autoindent = true
vim.bo.autoindent = true
vim.o.smartindent = true

vim.o.autoread = true
vim.bo.autoread = true

vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.incsearch = true

vim.o.wildmenu = true

vim.o.showtabline = 2

vim.o.showmode = false

vim.o.mouse = "a"

vim.o.termguicolors = true
vim.opt.termguicolors = true

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
--]=]
