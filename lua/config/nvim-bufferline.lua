require('bufferline').setup {
  highlights = {
    -- fill = { bg = 'none' },
    buffer_selected = { fg = '#f7bb3b', bold = false, italic = false },
    buffer_visible = { fg = '#928374' }
    -- indicator_selected = { fg = '#08cd7d' },
    -- separator = { bg = 'none' }
  },
  options = {
    hover = { enabled = false },
    mode = "buffers",
    numbers = "none",
    buffer_close_icon = '',
    indicator = {
      style = 'none',
      -- icon = ' ',
      icon = ''
    },
    modified_icon = '●',
    close_icon = '',
    -- left_trunc_marker = '',
    -- right_trunc_marker = '',
    name_formatter = function(buf)
      if buf.name:match('%.md') then
        return vim.fn.fnamemodify(buf.name, ':t:r')
      end
    end,
    max_name_length = 18,
    max_prefix_length = 15,
    tab_size = 18,
    color_icons = true,
    show_buffer_close_icons = true,
    show_tab_indicators = false,
    separator_style = 'thin',
    --mappings = true,
    always_show_bufferline = true,
    enforce_regular_tabs = true,
    diagnostics = false,
    -- diagnostics_indicator = function(count, level, diagnostics_dict, context)
    --   return '("..count..")'
    -- end,
    offsets = {
      { filetype = 'NvimTree', text = ' Explorer', padding = 1 }
    }
  }
}
