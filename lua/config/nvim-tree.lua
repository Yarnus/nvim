local ok, tree_c = pcall(require, 'nvim-tree.config')
if not ok then
  vim.notify(tree_c, vim.log.levels.ERROR)
  return
end

local tree_cb = tree_c.nvim_tree_callback

vim.g.nvim_tree_git_hl = 1
vim.g.nvim_tree_group_empty = 1

vim.g.nvim_tree_show_icons = {
  git = 1,
  folders = 1,
  files = 1,
  folder_arrows = 1
}

vim.g.nvim_tree_icons = {
  default = '',
  symlink = '',

  git = {
    unstaged = '✗',
    staged = '✓',
    unmerged = '',
    renamed = '➜',
    untracked = '★',
    deleted = '',
    ignored = '◌'
  },

  folder = {
    arrow_open = '',
    arrow_closed = '',
    default = '',
    open = '',
    empty = '',
    empty_open = '',
    symlink = '',
    symlink_open = '',
  },

  lsp = {
    hint = '',
    info = '',
    warning = '',
    error = ''
  }
}

-- hide the statusline when toggle nvim tree
-- vim.cmd [[au BufEnter,BufWinEnter,WinEnter,CmdwinEnter * if bufname('%') == 'NvimTree' | set laststatus=0 | else | set laststatus=2 | endif]]

require 'nvim-tree'.setup {
  disable_netrw       = true,
  hijack_netrw        = true,
  open_on_setup       = false,
  ignore_ft_on_setup  = { 'startify', 'dashboard' },
  auto_close          = false,
  open_on_tab         = false,
  actions             = {
    open_file = {
      window_picker = { enable = false }
    }
  },
  renderer            = {
    indent_makers = { enable = true },

  },
  hijack_cursor       = true,
  update_cwd          = false,
  update_to_buf_dir   = {
    enable = true,
    update_cwd = false,
    auto_open = true,
    ignore_list = {}
  },
  diagnostics         = {
    enable = false,
    icons = {
      hint = '',
      info = '',
      warning = '',
      error = '',
    }
  },
  update_focused_file = {
    enable      = false,
    update_cwd  = false,
    ignore_list = {}
  },
  system_open         = {
    cmd  = nil,
    args = {}
  },
  filters             = {
    dotfiles = true,
    custom = { '.git', 'node_modules', '_build', 'deps' }
  },
  git                 = {
    enable = true,
    ignore = true,
    timeout = 500,
  },
  view                = {
    -- width of the window, can be either a number (columns) or a string in `%`
    width = 30,
    -- side of the tree, can be one of 'left' | 'right' | 'top' | 'bottom'
    side = 'left',
    auto_resize = false,
    mappings = {
      custom_only = true,
      list = {
        { key = { '<CR>', '<2-LeftMouse>' }, cb = tree_cb('edit') },
        -- { key = {'<2-RightMouse>', '<C-]>'},    cb = tree_cb('cd') },
        { key = 'v', cb = tree_cb('vsplit') },
        { key = 's', cb = tree_cb('split') },
        -- { key = '<C-t>',                        cb = tree_cb('tabnew') },
        { key = '<', cb = tree_cb('prev_sibling') },
        { key = '>', cb = tree_cb('next_sibling') },
        { key = 'p', cb = tree_cb('parent_node') },
        -- { key = '<BS>',                         cb = tree_cb('close_node') },
        -- { key = '<S-CR>',                       cb = tree_cb('close_node') },
        --{ key = '<Tab>',                        cb = tree_cb('preview') },
        -- { key = 'K',                            cb = tree_cb('first_sibling') },
        -- { key = 'J',                            cb = tree_cb('last_sibling') },
        { key = 'I', cb = tree_cb('toggle_ignored') },
        { key = 'H', cb = tree_cb('toggle_dotfiles') },
        { key = 'r', cb = tree_cb('refresh') },
        { key = 'a', cb = tree_cb('create') },
        { key = 'd', cb = tree_cb('remove') },
        { key = 'R', cb = tree_cb('rename') },
        { key = '<C-r>', cb = tree_cb('full_rename') },
        -- { key = 'x',                            cb = tree_cb('cut') },
        -- { key = 'c',                            cb = tree_cb('copy') },
        -- { key = 'p',                            cb = tree_cb('paste') },
        { key = 'y', cb = tree_cb('copy_name') },
        { key = 'Y', cb = tree_cb('copy_path') },
        { key = 'gy', cb = tree_cb('copy_absolute_path') },
        -- { key = '[c',                           cb = tree_cb('prev_git_item') },
        -- { key = ']c',                           cb = tree_cb('next_git_item') },
        { key = '-', cb = tree_cb('dir_up') },
        { key = 'q', cb = tree_cb('close') },
        { key = 'o', cb = tree_cb('system_open') },
        { key = 'g?', cb = tree_cb('toggle_help') }
      }
    }
  }
}
