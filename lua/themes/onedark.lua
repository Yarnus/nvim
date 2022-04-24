require('onedark').setup {
  -- Main options --
  style = 'darker', -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
  transparent = false, -- Show/hide background
  term_colors = true, -- Change terminal color as per the selected theme style
  ending_tildes = false, -- Show the end-of-buffer tildes. By default they are hidden
  -- toggle theme style ---
  toggle_style_key = '<leader>ts', -- Default keybinding to toggle
  toggle_style_list = { 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer', 'light' }, -- List of styles to toggle between

  -- You can configure multiple style with comma seperated, For e.g., keywords = 'italic,bold'
  code_style = {
    comments = 'none',
    keywords = 'none',
    functions = 'none',
    strings = 'none',
    variables = 'none'
  },
  -- Custom Highlights --
  colors = {
    black = "#4c4c4c",
    -- 主题背景颜色
    bg0 = "#0d0d17",
    bg1 = "#191919",
    bg2 = "#333333",
    bg3 = "#4c4c4c",
    bg_d = "#06060c",
    bg_yellow = "#e8c88c",
    fg = "#e5e5e5",
    purple = "#ff78a2",
    dark_purple = "#fe2a6c",
    green = "#09c87a",
    orange = "#d19a66",
    -- blue = "#6095fe",
    blue = "#079ee8",
    bg_blue = "#61afef",
    -- yellow = "#fefb67",
    yellow   = '#fabd2f',
    dark_yellow = "#f5f079",
    cyan = "#0ae78d",
    dark_cyan = "#09c87a",
    red = "#f16c85",
    dark_red = "#f12d52",
    grey = "#333333",
    light_grey = "#4c4c4c",
    diff_add = "#09c87a",
    diff_delete = "#ff78a2",
    diff_change = "#3081df",
    diff_text = "#274964",
  },

  highlights = {}, -- Override highlight groups

  -- Plugins Config --
  diagnostics = {
    darker = true, -- darker colors for diagnostic
    undercurl = true, -- use undercurl instead of underline for diagnostics
    background = false, -- use background color for virtual text
  },
}
require('onedark').load()
