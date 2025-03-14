local actions = require("fzf-lua").actions

vim.env.BAT_THEME = "GitHub"

local winopts = {
  height     = 0.85, -- window height
  width      = 0.80, -- window width
  row        = 0.35, -- window row position (0=top, 1=bottom)
  col        = 0.50,
  border     = "rounded",
  treesitter = {
    enabled    = true,
    fzf_colors = { ["hl"] = "-1:reverse", ["hl+"] = "-1:reverse" }
  },
  preview    = {
    layout = 'flex',
    border = 'rounded',
    warp = true,
    title = false,
    scrollbar = false,
    delay = 20,
    -- builtin previewer window options
    winopts = {
      number         = true,
      relativenumber = false,
      cursorline     = true,
      cursorlineopt  = "both",
      cursorcolumn   = false,
      signcolumn     = "no",
      list           = false,
      foldenable     = false,
      foldmethod     = "manual",
    }
  }
}


require('fzf-lua').setup({
  file_icon_padding = '',
  winopts = winopts,
  actions = {
    files = {
      ["enter"]  = actions.file_switch_or_edit,
      ["ctrl-e"] = actions.file_vsplit,
    },
  },
  hls = {
    preview_border  = "Normal",
    preview_title   = 'Title',
    prompt          = 'Directory',
    cursor_line     = 'CursorLine',
    cursor          = 'Cursor',
    scrollbar_thumb = 'PmenuThumb'
  },
  keymap = {
    fzf = {
      ['tab']       = 'down',       -- 原Tab键映射为下移
      ['shift-tab'] = 'up',         -- 原Shift-Tab映射为上移
      ['ctrl-m']    = 'toggle-all', -- 可选：将多选功能转移到其他键
    },
  },
  fzf_opts = {
    -- 自定义指示器样式
    ["--ansi"]           = true,
    ["--style"]          = "minimal",
    ["--info"]           = "inline-right", -- fzf < v0.42 = "inline"
    ["--height"]         = "100%",
    ["--layout"]         = "reverse",
    ["--border"]         = "none",
    ["--highlight-line"] = true, -- fzf >= v0.53
    -- ['--pointer']        = '➜', -- 当前选中项的指示器
    ['--marker']         = '✓', -- 多选时的标记符号
  },
})
