vim.cmd([[
  set background=light
  colorscheme PaperColor
]])


-- 自定义一些高亮配置
vim.cmd([[
  " highlight Normal guibg=NONE ctermbg=NONE
  highlight SignColumn guibg=NONE
  highlight VertSplit guibg=NONE

  " 搜索高亮配置
  highlight Type guifg=#d75f5f
  highlight Search guibg=#005faf guifg=#ffffff
  highlight IncSearch guibg=#005faf guifg=#ffffff
  highlight CurSearch guibg=#005f00 guifg=#ffffff
  highlight GitGutterChange guifg=#005faf

  " 补全窗口相关配置
  "highlight Pmenu guibg=#c8cfd8 guifg=#2c3e50
  "highlight PmenuSel guibg=#005faf guifg=white gui=bold
  "highlight PmenuSbar guibg=#b8c2ce
  "highlight PmenuThumb guibg=#8696aa

  " LSP 浮动窗口配置
  "highlight NormalFloat guibg=#c8cfd8 guifg=#2c3e50
  "highlight FloatBorder guifg=#8696aa

  " Bufferline 配置
  highlight TabLine guifg=#8e908c guibg=#eeeeee
  highlight TabLineSel guifg=#005faf guibg=#eeeeee gui=bold
  highlight TabLineFill guibg=#eeeeee

  " 补全项类型配置 - 调整为更深的颜色
  highlight CmpItemKindFunction guifg=#004080
  highlight CmpItemKindMethod guifg=#004080
  highlight CmpItemKindVariable guifg=#006000
  highlight CmpItemKindKeyword guifg=#904000
  highlight CmpItemKindText guifg=#2c3e50
  highlight CmpItemKindProperty guifg=#005080
  highlight CmpItemKindClass guifg=#004c6f
  highlight CmpItemKindInterface guifg=#004c6f
  highlight CmpItemKindSnippet guifg=#603000

  " 诊断相关配置
  highlight Error guifg=#af0000 guibg=NONE
  highlight DiagnosticError guifg=#af0000 guibg=NONE
  highlight DiagnosticSignError guifg=#af0000 guibg=NONE
  highlight DiagnosticFloatingError guifg=#FF0000 guibg=#1E1E1E

  " Treesitter 高亮配置
  highlight TSKeyword guifg=#0050a0 gui=italic
  highlight TSString guifg=#007000
  highlight TSNumber guifg=#b05000
  highlight TSBoolean guifg=#0050a0 gui=italic
  highlight TSComment guifg=#707070 gui=italic
  highlight TSFunction guifg=#0050a0
  highlight TSMethod guifg=#0050a0
  highlight TSParameter guifg=#444444
  highlight TSConstructor guifg=#005f87
  highlight TSVariable guifg=#444444
  highlight TSType guifg=#005f87
  highlight TSPunctDelimiter guifg=#444444
  highlight TSPunctBracket guifg=#444444
  highlight TSPunctSpecial guifg=#444444
  highlight TSTag guifg=#0050a0
  highlight TSTagDelimiter guifg=#707070

  " Elixir 特定高亮
  highlight elixirModuleDeclaration guifg=#900000 gui=bold
  highlight elixirAlias guifg=#900000
  highlight elixirAtom guifg=#006090
  highlight elixirDefine guifg=#0050a0 gui=italic
  highlight elixirModuleDefine guifg=#0050a0 gui=italic
  highlight elixirMacro guifg=#b05000
  highlight elixirPrivateFunctionDeclaration guifg=#0050a0
  highlight elixirStringDelimiter guifg=#007000
  highlight elixirMapDelimiter guifg=#444444
  highlight elixirOperator guifg=#444444
  highlight elixirDoc guifg=#707070 gui=italic
  highlight elixirDocString guifg=#707070 gui=italic
  highlight elixirDocTest guifg=#707070 gui=italic
  highlight elixirVariable guifg=#444444
  highlight elixirUnusedVariable guifg=#707070 gui=italic
  highlight elixirId guifg=#444444
  highlight elixirBlockDefinition guifg=#0050a0 gui=italic
  highlight elixirBoolean guifg=#0050a0 gui=italic
]])
