vim.g.mapleader = ','
vim.o.termguicolors=true
vim.o.number=true
vim.o.tabstop=2
vim.o.shiftwidth=2
vim.o.softtabstop=2
-- replace tabs to spaces
vim.o.expandtab = true
-- only even number of spaces (3 spaces + tab = 4 spaces, 2 spaces + tab = 4 spaces)
vim.o.smarttab = true
-- reduce redraw
vim.o.lazyredraw=true
-- disable ring
vim.o.errorbells=false
vim.o.visualbell=false

-- divider
vim.o.fillchars='vert:ǀ'
-- vim.o.fillchars=vert:│,stl:\ ,stlnc:\
-- vim.o.list lcs=tab:\ \ ,conceal:\|

-- deafult split location
vim.o.splitbelow=true
vim.o.splitright=true

-- disable line wrap
vim.o.wrap = false

-- minimum reserve line when scrolling
vim.o.scrolloff=5
vim.o.backspace='2'
vim.o.encoding='UTF-8'
-- vim.o.filetype='on'
-- filetype plugin on


-- copy vim -> os clipboard
vim.o.clipboard='unnamed'
vim.o.langmenu='zh_CN.UTF-8'
-- show match space
vim.o.showmatch=true
-- search stuff
vim.o.hlsearch=true
vim.o.ignorecase=true
vim.o.smartcase=true

-- disable backup even gen a swap file
vim.o.backup=false
vim.o.swapfile=false
vim.o.writebackup=false
vim.o.autoread=true

-- avoid change buffer before you save current file.
vim.o.hidden=true
vim.o.laststatus = 2

-- size of the saved command-lines in a history table
vim.o.history = 1000

