local config = {}


function config.lualine()

    local symbols_outline = {
        sections = {
            lualine_a = {'mode'},
            lualine_b = {'filetype'},
            lualine_c = {},
            lualine_x = {},
            lualine_y = {},
            lualine_z = {'location'}
        },
        filetypes = {'Outline'}
    }

    require("lualine").setup {
        options = {
            icons_enabled = true,
            -- theme = "catppuccin",
            disabled_filetypes = {},
            component_separators = "|",
            section_separators = {left = "", right = ""}
        },
        sections = {
            lualine_a = {"mode"},
            lualine_b = {{"branch"}, {"diff"}},
            lualine_c = {
            },
            lualine_x = {
                {
                    "diagnostics",
                    sources = {'nvim_diagnostic'},
                    symbols = {error = " ", warn = " ", info = " "}
                }
            },
            lualine_y = {"filetype", "encoding", "fileformat"}
        },
        inactive_sections = {
            lualine_a = {},
            lualine_b = {},
            lualine_c = {"filename"},
            lualine_x = {"location"},
            lualine_y = {},
            lualine_z = {}
        },
        tabline = {},
        extensions = {
            "quickfix", "nvim-tree", "toggleterm", "fugitive", symbols_outline
        }
    }
end


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
    require("gitsigns").setup {
        signs = {
            add = {
                hl = 'GitSignsAdd',
                text = '│',
                numhl = 'GitSignsAddNr',
                linehl = 'GitSignsAddLn'
            },
            change = {
                hl = 'GitSignsChange',
                text = '│',
                numhl = 'GitSignsChangeNr',
                linehl = 'GitSignsChangeLn'
            },
            delete = {
                hl = 'GitSignsDelete',
                text = '_',
                numhl = 'GitSignsDeleteNr',
                linehl = 'GitSignsDeleteLn'
            },
            topdelete = {
                hl = 'GitSignsDelete',
                text = '‾',
                numhl = 'GitSignsDeleteNr',
                linehl = 'GitSignsDeleteLn'
            },
            changedelete = {
                hl = 'GitSignsChange',
                text = '~',
                numhl = 'GitSignsChangeNr',
                linehl = 'GitSignsChangeLn'
            }
        },
        keymaps = {
            -- Default keymap options
            noremap = true,
            buffer = true,
            ["n ]g"] = {
                expr = true,
                '&diff ? \']g\' : \'<cmd>lua require"gitsigns".next_hunk()<CR>\''
            },
            ["n [g"] = {
                expr = true,
                '&diff ? \'[g\' : \'<cmd>lua require"gitsigns".prev_hunk()<CR>\''
            },
            ["n <leader>hs"] = '<cmd>lua require"gitsigns".stage_hunk()<CR>',
            ["v <leader>hs"] = '<cmd>lua require"gitsigns".stage_hunk({vim.fn.line("."), vim.fn.line("v")})<CR>',
            ["n <leader>hu"] = '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>',
            ["n <leader>hr"] = '<cmd>lua require"gitsigns".reset_hunk()<CR>',
            ["v <leader>hr"] = '<cmd>lua require"gitsigns".reset_hunk({vim.fn.line("."), vim.fn.line("v")})<CR>',
            ["n <leader>hR"] = '<cmd>lua require"gitsigns".reset_buffer()<CR>',
            ["n <leader>hp"] = '<cmd>lua require"gitsigns".preview_hunk()<CR>',
            ["n <leader>hb"] = '<cmd>lua require"gitsigns".blame_line(true)<CR>',
            -- Text objects
            ["o ih"] = ':<C-U>lua require"gitsigns".text_object()<CR>',
            ["x ih"] = ':<C-U>lua require"gitsigns".text_object()<CR>'
        },
        watch_gitdir = {interval = 1000, follow_files = true},
        current_line_blame = true,
        current_line_blame_opts = {delay = 1000, virtual_text_pos = "eol"},
        sign_priority = 6,
        update_debounce = 100,
        status_formatter = nil, -- Use default
        word_diff = false,
        diff_opts = {internal = true}
    }
end

return config
