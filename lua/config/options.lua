vim.opt.fixeol = true
vim.g.mapleader = ","
vim.opt.termguicolors = true
vim.opt.mouse = ""
vim.opt.autoread = true
-- disable ring
vim.opt.errorbells = false
vim.opt.visualbell = false
-- avoid change buffer but force you save current file.
vim.opt.hidden = true
vim.opt.fileformats = "unix,mac,dos"
vim.opt.magic = true
vim.opt.virtualedit = "block"
vim.opt.encoding = "utf-8"
vim.opt.viewoptions = "folds,cursor,curdir,slash,unix"
vim.opt.sessionoptions = "curdir,help,tabpages,winsize"
vim.opt.wildignorecase = true
vim.opt.wildignore =
	".git,.hg,.svn,*.pyc,*.o,*.out,*.jpg,*.jpeg,*.png,*.gif,*.zip,**/tmp/**,*.DS_Store,**/node_modules/**,**/bower_modules/**"

-- disable backup even gen a swap file
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false
vim.opt.history = 2000
vim.opt.shada = "!,'300,<50,@100,s10,h"
vim.opt.backupskip = "/tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*,*/shm/*,/private/var/*,.vault.vim"
-- only even number of spaces (3 spaces + tab = 4 spaces, 2 spaces + tab = 4 spaces)
vim.opt.smarttab = true
vim.opt.shiftround = true
vim.opt.timeout = true
vim.opt.ttimeout = true
vim.opt.timeoutlen = 500
vim.opt.ttimeoutlen = 10
vim.opt.updatetime = 100
vim.opt.redrawtime = 1500

-- search stuff
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.infercase = true
vim.opt.incsearch = true
vim.opt.wrapscan = true
vim.opt.complete = ".,w,b,k"
vim.opt.inccommand = "nosplit"
vim.opt.grepformat = "%f:%l:%c:%m"
vim.opt.grepprg = "rg --hidden --vimgrep --smart-case --"
vim.opt.breakat = [[\ \	;:,!?]]
vim.opt.startofline = false
vim.opt.whichwrap = "h,l,<,>,[,],~"
-- default split location
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.switchbuf = "useopen"
vim.opt.backspace = "indent,eol,start"
vim.opt.diffopt = "filler,iwhite,internal,algorithm:patience"
vim.opt.completeopt = "menu,menuone,noselect"
vim.opt.jumpoptions = "stack"
-- show match space
vim.opt.showmode = false
vim.opt.shortmess = "aoOTIcF"
vim.opt.scrolloff = 5
vim.opt.sidescrolloff = 5
vim.opt.foldlevelstart = 99
vim.opt.ruler = false
vim.opt.list = false
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
vim.opt.showtabline = 2
vim.opt.winwidth = 30
vim.opt.winminwidth = 10
vim.opt.pumheight = 15
vim.opt.helpheight = 12
vim.opt.previewheight = 12
vim.opt.showcmd = false
-- just for nightly
vim.opt.cmdheight = 1
vim.opt.cmdwinheight = 5
vim.opt.equalalways = false
vim.opt.laststatus = 3
vim.opt.display = "lastline"
vim.opt.showbreak = "↳  "
vim.opt.listchars = "tab:»·,nbsp:+,trail:·,extends:→,precedes:←"
-- neovim transparent stuff
vim.opt.pumblend = 0
vim.opt.winblend = 0
vim.opt.undofile = false
vim.opt.synmaxcol = 2500
vim.opt.formatoptions = "1jcroql"
vim.opt.textwidth = 80
-- replace tabs to spaces
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.breakindent = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = -1
vim.opt.breakindentopt = "shift:2,min:20"
-- disable line wrap
vim.opt.wrap = false
vim.opt.linebreak = true
vim.opt.number = true
vim.opt.colorcolumn = ""
vim.opt.foldenable = false
vim.opt.signcolumn = "yes"
vim.opt.conceallevel = 2
vim.opt.concealcursor = "niv"
vim.opt.cursorlineopt = { "number" }
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.foldmethod = "expr"
-- vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
