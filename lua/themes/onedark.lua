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
    black = "#272727",
    -- 主题背景颜色
    bg0 = "#202020",
    bg1 = "#282c34",
    bg2 = "#30363f",
    bg3 = "#323641",
    bg_d = "#181818",
    bg_blue = "#61afef",
    bg_yellow = "#e8c88c",
    fg = "#a0a8b7",
    purple = "#b16286",
    green = "#b8ba25",
    orange = "#d19a66",
    -- blue = "#448488",
    blue = "#86c1b9",
    yellow = "#e5c07b",
    cyan = "#8ec07b",
    red = "#fb4833",
    grey = "#535965",
    light_grey = "#7a818e",
    dark_cyan = "#689d69",
    dark_red = "#cc231c",
    dark_yellow = "#d79920",
    dark_purple = "#5d4d7a",
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
