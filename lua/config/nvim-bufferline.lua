require('bufferline').setup{
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
    max_name_length = 20,
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
