-- local keymap = vim.keymap.set
local saga = require('lspsaga')
saga.init_lsp_saga({
  border_style = 'rounded',
  saga_winblend = 0,
  -- move_in_saga = { prev = '<C-p>',next = '<C-n>'},
  diagnostic_header = { " ", " ", " ", "ﴞ " },
  code_action_icon = '💡',
  code_action_lightbulb = {
    enable = false,
    sign = false,
    enable_in_insert = true,
    sign_priority = 20,
    virtual_text = true,
  },
  finder_icons = {
    def = '  ',
    ref = '諭 ',
    link = '  ',
  },
  finder_action_keys = {
    open = "<CR>",
    vsplit = "v",
    split = nil,
    tabe = nil,
    quit = { "q", "<Esc>" },
    scroll_down = "<C-f>",
    scroll_up = "<C-b>", -- quit can be a table
  },
  code_action_keys = {
    quit = "q",
    exec = "<CR>",
  }
})
