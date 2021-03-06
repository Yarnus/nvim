require('bufferline').setup {
  highlights = {
    buffer_selected = {
      guifg = '#FABD2F',
      guibg = 'none',
      gui = "bold"
    },
    indicator_selected = { guifg = '#FABD2F' },
    separator = { guifg = 'none' }
  };
  options = {
    mode = "buffers",
    numbers = "none",
    buffer_close_icon = '',
    indicator_icon = ' ',
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
    show_buffer_icons = true,
    show_buffer_default_icon = true,
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
      { filetype = 'NvimTree', text = ' Explorer', padding = 1 },
      { filetype = 'neo-tree', text = ' Explorer', padding = 1 },
    }
  }
}
