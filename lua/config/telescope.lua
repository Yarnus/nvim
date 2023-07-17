local ok, telescope = pcall(require, 'telescope')
if not ok then return end

telescope.setup({
  defaults = {
    vimgrep_arguments = {
      'rg', '--color=never', '--no-heading', '--with-filename',
      '--line-number', '--column', '--smart-case'
    },
    prompt_prefix = '❯ ',
    selection_caret = ' ',
    entry_prefix = '  ',
    multi_icon = ' ',
    initial_mode = 'insert',
    selection_strategy = 'reset',
    sorting_strategy = 'ascending',
    layout_strategy = 'flex',
    layout_config = {
      horizontal = {
        prompt_position = 'top',
        preview_width = 0.55,
      },
      vertical = {
        mirror = false,
      },
      width = 0.87,
      height = 0.80,
      preview_cutoff = 120
    },
    file_sorter = require('telescope.sorters').get_fuzzy_file,
    -- Example: { "^scratch/" } -- ignore all files in scratch directory
    -- Example: { "%.npz" } -- ignore all npz files
    file_ignore_patterns = { "^node_modules/", ".pyc", ".xlsx", ".xls" },
    generic_sorter = require('telescope.sorters').get_generic_fuzzy_sorter,
    path_display = { 'absolute' },
    winblend = 0,
    border = {},
    -- borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
    borderchars = { '─', '│', '─', '│', '┌', '┐', '┘', '└' },
    color_devicons = true,
    use_less = true,
    set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
    file_previewer = require('telescope.previewers').vim_buffer_cat.new,
    grep_previewer = require('telescope.previewers').vim_buffer_vimgrep.new,
    qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,
    -- Developer configurations: Not meant for general override
    buffer_previewer_maker = require('telescope.previewers').buffer_previewer_maker
  },
  extensions = {
    fzf = {
      fuzzy = true,                   -- false will only do exact matching
      override_generic_sorter = true, -- override the generic sorter
      override_file_sorter = true,    -- override the file sorter
      case_mode = 'smart_case'        -- or 'ignore_case' or 'respect_case'
      -- the default case_mode is 'smart_case'
    },
    fzy_native = {
      override_generic_sorter = false,
      override_file_sorter = true,
    }
  }
})

require('telescope').load_extension('fzy_native')
require('telescope').load_extension('aerial')
vim.cmd('command! -nargs=0 Grep :Telescope live_grep')
