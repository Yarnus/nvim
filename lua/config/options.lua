vim.opt.expandtab = true -- Convert tabs to spaces
vim.opt.shiftwidth = 4 -- Amount to indent with << and >>
vim.opt.tabstop = 4 -- How many spaces are shown per Tab
vim.opt.softtabstop = 4 -- How many spaces are applied when pressing Tab
vim.opt.smarttab = true
vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.breakindent = true
vim.opt.undofile = false
vim.opt.mouse = ""
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.signcolumn = "yes"
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.list = false
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
vim.opt.scrolloff = 5

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false
