local wezterm = require 'wezterm'

wezterm.on(
  'format-tab-title',
  function(tab, tabs, panes, config, hover, max_width)
    local str = tab.active_pane.title
    local index = tab.tab_index + 1

    str = string.gsub(str, '(.*[/\\])(.*)', '%2')


    if str == "..yale_umbrella" then
      str = "royale"
    elseif str == "vim" then
      str = "nvim"
    end

    local title = ' ' .. index .. '.' .. str .. ' '
    return { { Text = title } }
  end
)


local key_bindings = {
  { key = 'Enter', mods = 'CMD',       action = wezterm.action.ToggleFullScreen },
  { key = 'c',     mods = 'CMD',       action = wezterm.action.CopyTo("Clipboard") },
  { key = 'v',     mods = 'CMD',       action = wezterm.action.PasteFrom("Clipboard") },
  { key = 'h',     mods = 'CMD',       action = wezterm.action.ActivatePaneDirection('Left') },
  { key = 'j',     mods = 'CMD',       action = wezterm.action.ActivatePaneDirection('Down') },
  { key = 'k',     mods = 'CMD',       action = wezterm.action.ActivatePaneDirection('Up') },
  { key = 'l',     mods = 'CMD',       action = wezterm.action.ActivatePaneDirection('Right') },
  { key = 'w',     mods = 'CMD',       action = wezterm.action.CloseCurrentPane { confirm = true } },
  { key = 'd',     mods = 'CMD',       action = wezterm.action.SplitPane { direction = 'Right', size = { Percent = 50 } } },
  { key = 'd',     mods = 'CMD|SHIFT', action = wezterm.action.SplitPane { direction = 'Down', size = { Percent = 50 } } },
  { key = 'n',     mods = 'CMD',       action = wezterm.action.RotatePanes 'Clockwise' },
}

local key_tables = {
  search_mode = {
    { key = 'Escape', mods = 'NONE', action = wezterm.action.CopyMode 'Close' },
    { key = 'Enter',  mods = 'NONE', action = wezterm.action.CopyMode 'PriorMatch' },
    { key = 'n',      mods = 'CTRL', action = wezterm.action.CopyMode 'NextMatch' },
    { key = 'p',      mods = 'CTRL', action = wezterm.action.CopyMode 'PriorMatch' },
    { key = 'r',      mods = 'CTRL', action = wezterm.action.CopyMode 'CycleMatchType' },
    { key = 'u',      mods = 'CTRL', action = wezterm.action.CopyMode 'ClearPattern' },
    {
      key = 'PageUp',
      mods = 'NONE',
      action = wezterm.action.CopyMode 'PriorMatchPage',
    },
    {
      key = 'PageDown',
      mods = 'NONE',
      action = wezterm.action.CopyMode 'NextMatchPage',
    },
    { key = 'UpArrow', mods = 'NONE', action = wezterm.action.CopyMode 'PriorMatch' },
    {
      key = 'DownArrow',
      mods = 'NONE',
      action = wezterm.action.CopyMode 'NextMatch',
    },

  }
}

local mouse_bindings = {
  {
    event = { Down = { streak = 1, button = 'Right' } },
    mods = 'NONE',
    action = wezterm.action.PasteFrom("Clipboard"),
  },
  -- Change the default click behavior so that it only selects
  -- text and doesn't open hyperlinks
  {
    event = { Up = { streak = 1, button = 'Left' } },
    mods = 'NONE',
    action = wezterm.action.CompleteSelection 'PrimarySelection',
  },
  -- and make CTRL-Click open hyperlinks
  {
    event = { Up = { streak = 1, button = 'Left' } },
    mods = 'CMD',
    action = wezterm.action.OpenLinkAtMouseCursor,
  },
}

-- https://wezfurlong.org/wezterm/config/lua/config/hyperlink_rules.html#hyperlink_rules
local hyperlink_rules = {
  { regex = '\\b\\w+://[\\w.-]+\\.[a-z]{2,15}\\S*\\b', format = '$0' },
  -- { regex = [[\b\w+@[\w-]+(\.[\w-]+)+\b]], format = 'mailto:$0' },
  -- { regex = [[\bfile://\S*\b]], format = '$0' },
  -- { regex = [[\b\w+://(?:[\d]{1,3}\.){3}[\d]{1,3}\S*\b]], format = '$0' },
  -- { regex = [[["]?([\w\d]{1}[-\w\d]+)(/){1}([-\w\d\.]+)["]?]], format = 'https://www.github.com/$1/$3' },
  -- match the URL with a PORT
  { regex = "\\b\\w+://(?:[\\w.-]+):\\d+\\S*\\b",      format = "$0", },
}

return {
  automatically_reload_config                = true,
  use_ime                                    = true,
  scrollback_lines                           = 5000,
  check_for_updates                          = false,
  window_decorations                         = "NONE | RESIZE",
  -- disable_default_mouse_bindings             = true,
  audible_bell                               = 'Disabled',
  prefer_egl                                 = true,
  native_macos_fullscreen_mode               = true,
  enable_tab_bar                             = true,
  use_fancy_tab_bar                          = false,
  tab_bar_at_bottom                          = false,
  show_tab_index_in_tab_bar                  = true,
  show_new_tab_button_in_tab_bar             = false,
  adjust_window_size_when_changing_font_size = false,
  default_cursor_style                       = 'BlinkingBlock',
  force_reverse_video_cursor                 = false,
  use_cap_height_to_scale_fallback_fonts     = true,
  font                                       = wezterm.font_with_fallback {
    {
      family = 'Monaco',
      weight = 'Regular',
      scale = 1.0,
    },
    {
      family = 'FiraCode Nerd Font',
      weight = 'Regular',
      scale = 1.0,
    },
    { family = '苹方-简', weight = 'Regular', scale = 1 },
  },
  font_rules                                 = {
    -- NOTE: i prefer disable italic & bold.
    -- { intensity = "Bold", font = wezterm.font('Monaco', { weight = 'Regular' }) },
    -- { italic = true, font = wezterm.font('Monaco', { weight = 'Regular' }) },
  },
  font_size                                  = 16,
  line_height                                = 1.1,
  bold_brightens_ansi_colors                 = true,
  freetype_load_target                       = 'Normal',
  freetype_load_flags                        = 'NO_HINTING|MONOCHROME',
  color_scheme                               = 'Google (light) (terminal.sexy)',
  colors                                     = {
    foreground = '#444444',
    background = '#eeeeee',

    cursor_bg = '#005faf',
    cursor_fg = 'white',
    cursor_border = '#005faf',

    selection_fg = 'white',
    selection_bg = '#005faf',

    -- 标签栏颜色
    tab_bar = {
      background = '#eeeeee',
      active_tab = {
        bg_color = '#eeeeee',
        fg_color = '#005faf',
      },
      inactive_tab = {
        bg_color = '#eeeeee',
        fg_color = '#8e908c',
      },
    },
  },
  tab_max_width                              = 80,
  initial_rows                               = 35,
  initial_cols                               = 120,
  window_background_opacity                  = 1,
  text_background_opacity                    = 1,
  window_padding                             = { left = 5, right = 5, top = 5, bottom = 0 },
  inactive_pane_hsb                          = { brightness = 1, hue = 1, saturation = 1 },
  keys                                       = key_bindings,
  key_tables                                 = key_tables,
  mouse_bindings                             = mouse_bindings,
  hyperlink_rules                            = hyperlink_rules
}
