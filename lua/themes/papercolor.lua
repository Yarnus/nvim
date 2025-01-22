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
  highlight Search guibg=#e4eeff guifg=NONE gui=underline
  highlight IncSearch guibg=#c3d5ff guifg=NONE gui=underline
  highlight CurSearch guibg=#c3d5ff guifg=NONE gui=underline

  " 补全窗口相关配置
  highlight Pmenu guibg=#f8f4e3 guifg=#444444
  highlight PmenuSel guibg=#005faf guifg=white gui=bold
  highlight PmenuSbar guibg=#ebe6d5
  highlight PmenuThumb guibg=#bbb4a5

  " LSP 浮动窗口配置
  highlight NormalFloat guibg=#f8f4e3 guifg=#444444
  highlight FloatBorder guifg=#444444

  " 补全项类型配置 - 调整为更易读的颜色
  highlight CmpItemKindFunction guifg=#0050a0
  highlight CmpItemKindMethod guifg=#0050a0
  highlight CmpItemKindVariable guifg=#007000
  highlight CmpItemKindKeyword guifg=#b05000
  highlight CmpItemKindText guifg=#444444
  highlight CmpItemKindProperty guifg=#006090
  highlight CmpItemKindClass guifg=#005f87
  highlight CmpItemKindInterface guifg=#005f87
  highlight CmpItemKindSnippet guifg=#704000

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
