vim.g.mapleader = ','
vim.opt.termguicolors = true
vim.opt.number = true
vim.opt.foldenable = false
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
-- replace tabs to spaces
vim.opt.expandtab = true
-- only even number of spaces (3 spaces + tab = 4 spaces, 2 spaces + tab = 4 spaces)
vim.opt.smarttab = true
-- reduce redraw
vim.opt.lazyredraw = true
-- disable ring
vim.opt.errorbells = false
vim.opt.visualbell = false

-- divider
vim.opt.fillchars = 'vert:ǀ'
-- vim.opt.fillchars=vert:│,stl:\ ,stlnc:\
-- vim.opt.list lcs=tab:\ \ ,conceal:\|

-- deafult split location
vim.opt.splitbelow = true
vim.opt.splitright = true

-- disable line wrap
vim.opt.wrap = false

-- minimum reserve line when scrolling
vim.opt.scrolloff = 5
vim.opt.backspace = '2'
vim.opt.encoding = 'UTF-8'
-- vim.opt.filetype='on'
-- filetype plugin on


-- copy vim -> os clipboard
vim.opt.clipboard = 'unnamed'
vim.opt.langmenu = 'zh_CN.UTF-8'
-- show match space
vim.opt.showmatch = true
-- search stuff
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- disable backup even gen a swap file
vim.opt.backup = false
vim.opt.swapfile = false
vim.opt.writebackup = false
vim.opt.autoread = true

-- avoid change buffer before you save current file.
vim.opt.hidden = true
vim.opt.laststatus = 2

-- size of the saved command-lines in a history table
vim.opt.history = 1000
