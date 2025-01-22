vim.g.mapleader = ','
vim.opt.termguicolors = true
-- vim.opt.mouse = 'nv'
vim.opt.mouse = ''
vim.opt.autoread = true
-- disable ring
vim.opt.errorbells = false
vim.opt.visualbell = false
-- avoid change buffer but force you save current file.
vim.opt.hidden = true
vim.opt.fileformats = 'unix,mac,dos'
vim.opt.magic = true
vim.opt.virtualedit = 'block'
vim.opt.encoding = 'utf-8'
vim.opt.viewoptions = 'folds,cursor,curdir,slash,unix'
vim.opt.sessionoptions = 'curdir,help,tabpages,winsize'
vim.opt.clipboard = 'unnamedplus'
vim.opt.wildignorecase = true
vim.opt.wildignore =
'.git,.hg,.svn,*.pyc,*.o,*.out,*.jpg,*.jpeg,*.png,*.gif,*.zip,**/tmp/**,*.DS_Store,**/node_modules/**,**/bower_modules/**'

-- disable backup even gen a swap file
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false
vim.opt.history = 2000
vim.opt.shada = "!,'300,<50,@100,s10,h"
vim.opt.backupskip = '/tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*,*/shm/*,/private/var/*,.vault.vim'
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
vim.opt.complete = '.,w,b,k'
vim.opt.inccommand = 'nosplit'
vim.opt.grepformat = '%f:%l:%c:%m'
vim.opt.grepprg = 'rg --hidden --vimgrep --smart-case --'
vim.opt.breakat = [[\ \	;:,!?]]
vim.opt.startofline = false
vim.opt.whichwrap = 'h,l,<,>,[,],~'
-- default split location
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.switchbuf = 'useopen'
vim.opt.backspace = 'indent,eol,start'
vim.opt.diffopt = 'filler,iwhite,internal,algorithm:patience'
vim.opt.completeopt = 'menu,menuone,noselect'
vim.opt.jumpoptions = 'stack'
-- show match space
vim.opt.showmode = false
vim.opt.shortmess = 'aoOTIcF'
vim.opt.scrolloff = 2
vim.opt.sidescrolloff = 5
vim.opt.foldlevelstart = 99
vim.opt.ruler = false
vim.opt.list = true
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
vim.opt.display = 'lastline'
vim.opt.showbreak = '↳  '
vim.opt.listchars = 'tab:»·,nbsp:+,trail:·,extends:→,precedes:←'
-- neovim transparent stuff
vim.opt.pumblend = 0
vim.opt.winblend = 0
vim.opt.undofile = false
vim.opt.synmaxcol = 2500
vim.opt.formatoptions = '1jcroql'
vim.opt.textwidth = 80
-- replace tabs to spaces
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = -1
vim.opt.breakindentopt = 'shift:2,min:20'
-- disable line wrap
vim.opt.wrap = false
vim.opt.linebreak = true
vim.opt.number = true
vim.opt.colorcolumn = ''
vim.opt.foldenable = false
vim.opt.signcolumn = 'yes'
vim.opt.conceallevel = 2
vim.opt.concealcursor = 'niv'
vim.opt.cursorlineopt = { "number" }
vim.opt.cursorline = false
vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'

if vim.loop.os_uname().sysname == 'Darwin' then
  vim.g.clipboard = {
    name = 'macOS-clipboard',
    copy = {
      ['+'] = 'pbcopy',
      ['*'] = 'pbcopy',
    },
    paste = {
      ['+'] = 'pbpaste',
      ['*'] = 'pbpaste',
    },
    cache_enabled = 0,
  }
end

-- 性能相关
vim.opt.updatetime = 100  -- 更快的更新时间(默认为4000ms)，建议设置在100-200之间
vim.opt.timeoutlen = 400  -- 更短的按键序列等待时间
vim.opt.redrawtime = 1500 -- 更短的重绘时间，提高大文件的性能
vim.opt.lazyredraw = true -- 不要在宏和脚本执行期间重绘
vim.opt.synmaxcol = 240   -- 只对前240列进行语法高亮
vim.opt.history = 200     -- 减少历史记录以节省内存

-- 文件相关
vim.opt.backup = false      -- 禁用备份文件
vim.opt.writebackup = false -- 禁用写入时的备份
vim.opt.swapfile = false    -- 禁用交换文件
vim.opt.undofile = true     -- 启用持久化撤销
vim.opt.undolevels = 1000   -- 最大撤销次数

-- UI相关
vim.opt.number = true          -- 显示行号
vim.opt.relativenumber = false -- 显示相对行号
vim.opt.signcolumn = "yes"     -- 总是显示符号列
vim.opt.cursorline = false     -- 高亮当前行
vim.opt.showmode = false       -- 不显示模式提示
vim.opt.wrap = false           -- 禁用自动换行
vim.opt.scrolloff = 8          -- 保持光标上下至少8行距离
vim.opt.sidescrolloff = 8      -- 保持光标左右至少8列距离
vim.opt.termguicolors = true   -- 启用24位颜色

-- 搜索相关
vim.opt.ignorecase = true -- 搜索时忽略大小写
vim.opt.smartcase = true  -- 如果包含大写字母，则不忽略大小写
vim.opt.hlsearch = true   -- 高亮搜索结果
vim.opt.incsearch = true  -- 增量搜索

-- 编辑相关
vim.opt.expandtab = true   -- 将制表符展开为空格
vim.opt.shiftwidth = 2     -- 缩进宽度为2
vim.opt.tabstop = 2        -- 制表符宽度为2
vim.opt.softtabstop = 2    -- 软制表符宽度为2
vim.opt.smartindent = true -- 智能缩进
vim.opt.autoindent = true  -- 自动缩进

-- 系统相关
vim.opt.clipboard = "unnamedplus" -- 使用系统剪贴板
vim.opt.mouse = "a"               -- 启用鼠标支持
vim.opt.splitright = true         -- 垂直分割时新窗口在右边
vim.opt.splitbelow = true         -- 水平分割时新窗口在下边

-- 补全相关
vim.opt.completeopt = "menu,menuone,noselect" -- 补全选项
vim.opt.pumheight = 10                        -- 补全菜单最大高度

-- 折叠相关
vim.opt.foldmethod = "expr"                     -- 使用表达式折叠
vim.opt.foldexpr = "nvim_treesitter#foldexpr()" -- 使用treesitter进行折叠
vim.opt.foldlevel = 99                          -- 默认展开所有折叠
vim.opt.foldenable = true                       -- 启用折叠

-- 性能优化
vim.g.did_install_default_menus = 1 -- 禁用默认菜单
vim.g.did_install_syntax_menu = 1   -- 禁用语法菜单
vim.g.did_indent_on = 1             -- 禁用自动缩进
vim.g.loaded_2html_plugin = 1       -- 禁用2html插件
vim.g.loaded_gzip = 1               -- 禁用gzip插件
vim.g.loaded_tarPlugin = 1          -- 禁用tar插件
vim.g.loaded_zipPlugin = 1          -- 禁用zip插件
vim.g.loaded_man = 1                -- 禁用man插件
vim.g.loaded_remote_plugins = 1     -- 禁用远程插件

-- 禁用不需要的内置插件
local disabled_built_ins = {
  "netrw",
  "netrwPlugin",
  "netrwSettings",
  "netrwFileHandlers",
  "matchit",
  "matchparen",
  "spec",
  "tar",
  "tarPlugin",
  "rrhelper",
  "vimball",
  "vimballPlugin",
  "getscript",
  "getscriptPlugin",
  "logipat",
}

for _, plugin in pairs(disabled_built_ins) do
  vim.g["loaded_" .. plugin] = 1
end
