local config = {}

function config.galaxyline() require("modules.ui.galaxyline") end

function config.nvim_tree()
    local tree_cb = require"nvim-tree.config".nvim_tree_callback

vim.g.nvim_tree_indent_markers = 1
vim.g.nvim_tree_git_hl = 1
vim.g.nvim_tree_disable_window_picker = 1
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

require'nvim-tree'.setup {
  disable_netrw       = true,
  hijack_netrw        = true,
  open_on_setup       = false,
  ignore_ft_on_setup  = {'startify', 'dashboard'},
  auto_close          = true,
  open_on_tab         = false,
  hijack_cursor       = true,
  update_cwd          = false,
  update_to_buf_dir   = {
    enable = true,
    update_cwd = false,
    auto_open = true,
    ignore_list = {}
  },
  diagnostics = {
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
  system_open = {
    cmd  = nil,
    args = {}
  },
  filters = {
    dotfiles = true,
    custom = {'.git', 'node_modules', '.cache', '_build', 'deps'}
  },
  view = {
      -- width of the window, can be either a number (columns) or a string in `%`
      width = 30,
      -- side of the tree, can be one of 'left' | 'right' | 'top' | 'bottom'
      side = 'left',
      auto_resize = false,
      mappings = {
        custom_only = true,
        list = {
            { key = {'<CR>', '<2-LeftMouse>'}, cb = tree_cb('edit') },
            -- { key = {'<2-RightMouse>', '<C-]>'},    cb = tree_cb('cd') },
            { key = 'v',                        cb = tree_cb('vsplit') },
            { key = 's',                        cb = tree_cb('split') },
            -- { key = '<C-t>',                        cb = tree_cb('tabnew') },
            { key = '<',                            cb = tree_cb('prev_sibling') },
            { key = '>',                            cb = tree_cb('next_sibling') },
            { key = 'p',                            cb = tree_cb('parent_node') },
            -- { key = '<BS>',                         cb = tree_cb('close_node') },
            -- { key = '<S-CR>',                       cb = tree_cb('close_node') },
            --{ key = '<Tab>',                        cb = tree_cb('preview') },
            -- { key = 'K',                            cb = tree_cb('first_sibling') },
            -- { key = 'J',                            cb = tree_cb('last_sibling') },
            { key = 'I',                            cb = tree_cb('toggle_ignored') },
            { key = 'H',                            cb = tree_cb('toggle_dotfiles') },
            { key = 'r',                            cb = tree_cb('refresh') },
            { key = 'a',                            cb = tree_cb('create') },
            { key = 'd',                            cb = tree_cb('remove') },
            { key = 'R',                            cb = tree_cb('rename') },
            { key = '<C-r>',                        cb = tree_cb('full_rename') },
            -- { key = 'x',                            cb = tree_cb('cut') },
            -- { key = 'c',                            cb = tree_cb('copy') },
            -- { key = 'p',                            cb = tree_cb('paste') },
            { key = 'y',                            cb = tree_cb('copy_name') },
            { key = 'Y',                            cb = tree_cb('copy_path') },
            { key = 'gy',                           cb = tree_cb('copy_absolute_path') },
            -- { key = '[c',                           cb = tree_cb('prev_git_item') },
            -- { key = ']c',                           cb = tree_cb('next_git_item') },
            { key = '-',                            cb = tree_cb('dir_up') },
            { key = 'q',                            cb = tree_cb('close') },
            { key = 'o',                            cb = tree_cb('system_open') },
            { key = 'g?',                           cb = tree_cb('toggle_help') }
        }
      }
    }
}

end

function config.nvim_bufferline()
    require("bufferline").setup {
        options = {
            buffer_close_icon = '',
            --mappings = true,
            always_show_bufferline = true,
            -- buffer_close_icon = '',
            indicator_icon = '▎',
                show_tab_indicators = true,
            modified_icon = '',
            close_icon = '',
                show_buffer_icons = true,
            max_name_length = 14,
            max_prefix_length = 13,
                tab_size = 20,
            separator_style = 'thin',
                diagnostics = false,
            diagnostics_indicator = function(count, level, diagnostics_dict, context)
              return '("..count..")'
            end,
                offsets = {{filetype = 'NvimTree', text = ' Explorer', padding = 1}}
          }
    }
end

function config.gitsigns()
  require('gitsigns').setup {
  signs = {
      add = {hl = 'GitGutterAdd', text = '▋'},
      change = {hl = 'GitGutterChange',text= '▋'},
      delete = {hl= 'GitGutterDelete', text = '▋'},
      topdelete = {hl ='GitGutterDeleteChange',text = '▔'},
      changedelete = {hl = 'GitGutterChange', text = '▎'},
    },
  numhl = false,
  linehl = false,
  keymaps = {
    noremap = true,
    ['n <leader>gb'] = '<cmd>lua require"gitsigns".blame_line{full=true}<CR>',
  },
  watch_index = {
    interval = 1000,
    follow_files = true
  },
  current_line_blame = false,
  sign_priority = 6,
  update_debounce = 100,
  status_formatter = nil, -- Use default
  word_diff = false,
}
end

function config.deus()
    vim.cmd [[colorscheme deus]]
end

return config
