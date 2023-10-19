require("everforest").setup({
  ---Controls the "hardness" of the background. Options are "soft", "medium" or "hard".
  ---Default is "medium".
  background = "soft",
  ---How much of the background should be transparent. 2 will have more UI
  ---components be transparent (e.g. status line background)
  transparent_background_level = 2,
  ---Whether italics should be used for keywords and more.
  italics = false,
  ---Disable italic fonts for comments. Comments are in italics by default, set
  ---this to `true` to make them _not_ italic!
  disable_italic_comments = false,
  ---By default, the colour of the sign column background is the same as the as normal text
  ---background, but you can use a grey background by setting this to `"grey"`.
  sign_column_background = "none",
  ---The contrast of line numbers, indent lines, etc. Options are `"high"` or
  ---`"low"` (default).
  ui_contrast = "low",
  ---Dim inactive windows. Only works in Neovim. Can look a bit weird with Telescope.
  ---
  ---When this option is used in conjunction with show_eob set to `false`, the
  ---end of the buffer will only be hidden inside the active window. Inside
  ---inactive windows, the end of buffer filler characters will be visible in
  ---dimmed symbols. This is due to the way Vim and Neovim handle `EndOfBuffer`.
  dim_inactive_windows = false,
  ---Some plugins support highlighting error/warning/info/hint texts, by
  ---default these texts are only underlined, but you can use this option to
  ---also highlight the background of them.
  diagnostic_text_highlight = false,
  ---Which colour the diagnostic text should be. Options are `"grey"` or `"coloured"` (default)
  diagnostic_virtual_text = "grey",
  ---Some plugins support highlighting error/warning/info/hint lines, but this
  ---feature is disabled by default in this colour scheme.
  diagnostic_line_highlight = false,
  ---By default, this color scheme won't colour the foreground of |spell|, instead
  ---colored under curls will be used. If you also want to colour the foreground,
  ---set this option to `true`.
  spell_foreground = false,
  ---Whether to show the EndOfBuffer highlight.
  show_eob = true,
  ---You can override specific highlights to use other groups or a hex colour.
  ---This function will be called with the highlights and colour palette tables.
  -- on_highlights = function(highlight_groups, palette) end,
  ---You can override colours in the palette to use different hex colours.
  ---This function will be called once the base and background colours have
  ---been mixed on the palette.
  colours_override = function(palette)
    palette.red = '#e75a7c'
  end,
})
--    black = '#111210',
--    bg0 = '#252623',
--    bg1 = '#2f312c',
--    bg2 = '#383b35',
--    bg3 = '#3a3d37',
--    bg_d = '#1c1e1b',
--    bg_blue = '#68aee8',
--    bg_yellow = '#e2c792',
--    fg = '#f1e9d2',
--    purple = '#aaaaff',
--    green = '#8fb573',
--    orange = '#ff9966',
--    blue = '#57a5e5',
--    yellow = '#dbb671',
--    cyan = '#70c2be',
--    red = '#e75a7c',
--    coral = '#f08080',
--    grey = '#5b5e5a',
--    light_grey = '#838781',
--    dark_cyan = '#2b5d63',
--    dark_red = '#833b3b',
--    dark_yellow = '#7c5c20',
--    dark_purple = '#79428a',
--    diff_add = '#40531b',
--    diff_delete = '#893f45',
--    diff_change = '#2a3a57',
--    diff_text = '#3a4a67',

require("everforest").load()
