require('gitsigns').setup {
  signs = {
    add = { hl = 'GitGutterAdd', text = '▋' },
    change = { hl = 'GitGutterChange', text = '▋' },
    delete = { hl = 'GitGutterDelete', text = '▋' },
    topdelete = { hl = 'GitGutterDeleteChange', text = '▔' },
    changedelete = { hl = 'GitGutterChange', text = '▎' },
  },
  numhl = false,
  linehl = false,
  keymaps = {
    noremap = true,
    ['n <leader>gb'] = '<cmd>lua require"gitsigns".blame_line{full=true}<CR>',
  },
  watch_gitdir = {
    interval = 1000,
    follow_files = true
  },
  current_line_blame = false,
  sign_priority = 6,
  update_debounce = 100,
  status_formatter = nil, -- Use default
  word_diff = false,

}
