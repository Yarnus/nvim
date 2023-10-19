local function on_attach(bufnr)
  local api = require('nvim-tree.api')

  local function opts(desc)
    return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  vim.keymap.set('n', '<C-]>', api.tree.change_root_to_node, opts('CD'))
  vim.keymap.set('n', 'v', api.node.open.vertical, opts('Open: Vertical Split'))
  vim.keymap.set('n', 's', api.node.open.horizontal, opts('Open: Horizontal Split'))
  vim.keymap.set('n', '<BS>', api.node.navigate.parent_close, opts('Close Directory'))
  vim.keymap.set('n', '<CR>', api.node.open.edit, opts('Open'))
  vim.keymap.set('n', '>', api.node.navigate.sibling.next, opts('Next Sibling'))
  vim.keymap.set('n', '<', api.node.navigate.sibling.prev, opts('Previous Sibling'))
  vim.keymap.set('n', '-', api.tree.change_root_to_parent, opts('Up'))
  vim.keymap.set('n', 'a', api.fs.create, opts('Create'))
  vim.keymap.set('n', 'd', api.fs.remove, opts('Delete'))
  vim.keymap.set('n', 'F', api.live_filter.clear, opts('Clean Filter'))
  vim.keymap.set('n', 'f', api.live_filter.start, opts('Filter'))
  vim.keymap.set('n', 'g?', api.tree.toggle_help, opts('Help'))
  vim.keymap.set('n', 'gy', api.fs.copy.absolute_path, opts('Copy Absolute Path'))
  vim.keymap.set('n', 'H', api.tree.toggle_hidden_filter, opts('Toggle Dotfiles'))
  vim.keymap.set('n', 'I', api.tree.toggle_gitignore_filter, opts('Toggle Git Ignore'))
  vim.keymap.set('n', 'o', api.node.open.edit, opts('Open'))
  vim.keymap.set('n', 'p', api.node.navigate.parent, opts('Parent Directory'))
  vim.keymap.set('n', 'q', api.tree.close, opts('Close'))
  vim.keymap.set('n', 'R', api.fs.rename, opts('Rename'))
  vim.keymap.set('n', 'r', api.tree.reload, opts('Refresh'))
  vim.keymap.set('n', 'S', api.tree.search_node, opts('Search'))
  vim.keymap.set('n', 'y', api.fs.copy.filename, opts('Copy Name'))
  vim.keymap.set('n', 'Y', api.fs.copy.relative_path, opts('Copy Relative Path'))
  vim.keymap.set('n', '<2-LeftMouse>', api.node.open.edit, opts('Open'))
  vim.keymap.set('n', '<2-RightMouse>', api.tree.change_root_to_node, opts('CD'))
end

-- hide the statusline when toggle nvim tree
-- vim.cmd [[au BufEnter,BufWinEnter,WinEnter,CmdwinEnter * if bufname('%') == 'NvimTree' | set laststatus=0 | else | set laststatus=2 | endif]]

require("nvim-tree").setup(
  {
    on_attach                          = on_attach,
    auto_reload_on_write               = true,
    disable_netrw                      = false,
    hijack_netrw                       = true,
    hijack_cursor                      = true,
    hijack_unnamed_buffer_when_opening = false,
    open_on_tab                        = false,
    sort_by                            = "name",
    prefer_startup_root                = false,
    sync_root_with_cwd                 = false,
    reload_on_bufenter                 = false,
    respect_buf_cwd                    = false,
    actions                            = {
      open_file = {
        window_picker = { enable = false }
      }
    },
    renderer                           = {
      add_trailing = false,
      group_empty = false,
      highlight_git = false,
      full_name = false,
      highlight_opened_files = "none",
      root_folder_modifier = ":~",
      indent_markers = {
        enable = false,
        icons = {
          corner = "└",
          edge = "│",
          item = "│",
          none = " ",
        },
      },
      icons = {
        webdev_colors = true,
        git_placement = "before",
        padding = " ",
        symlink_arrow = " ➛ ",
        show = {
          file = true,
          folder = true,
          folder_arrow = true,
          git = true,
        },
        glyphs = {
          default = "",
          symlink = "",
          bookmark = "",
          folder = {
            arrow_closed = "",
            arrow_open = "",
            default = "",
            open = "",
            empty = "",
            empty_open = "",
            symlink = "",
            symlink_open = "",
          },
          git = {
            unstaged = "✗",
            staged = "✓",
            unmerged = "",
            renamed = "➜",
            untracked = "★",
            deleted = "",
            ignored = "◌",
          },
        },
      },
      special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md" },
      symlink_destination = false,
    },
    update_cwd                         = false,
    diagnostics                        = {
      enable = false,
      icons = {
        hint = '',
        info = '',
        warning = '',
        error = '',
      }
    },
    update_focused_file                = {
      enable      = false,
      update_cwd  = false,
      ignore_list = {}
    },
    system_open                        = {
      cmd  = nil,
      args = {}
    },
    filters                            = {
      dotfiles = true,
      custom = { 'node_modules/', '_build/', 'deps/' }
    },
    git                                = {
      enable = true,
      ignore = true,
      show_on_dirs = true,
      timeout = 400,
    },
    view                               = {
      -- width of the window, can be either a number (columns) or a string in `%`
      width = 30,
      -- side of the tree, can be one of 'left' | 'right' | 'top' | 'bottom'
      side = 'left',
    }
  })

local function open_nvim_tree(data)
  local IGNORED_FT = {
    'startify', 'dashboard'
  }

  -- buffer is a real file on the disk
  local real_file = vim.fn.filereadable(data.file) == 1

  -- buffer is a [No Name]
  local no_name = data.file == "" and vim.bo[data.buf].buftype == ""

  -- &ft
  local filetype = vim.bo[data.buf].ft

  -- only files please
  if not real_file and not no_name then
    return
  end

  -- skip ignored filetypes
  if vim.tbl_contains(IGNORED_FT, filetype) then
    return
  end

  -- open the tree but don't focus it
  -- require("nvim-tree.api").tree.toggle({ focus = false })
end

vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
