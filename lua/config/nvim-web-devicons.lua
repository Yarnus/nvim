require 'nvim-web-devicons'.setup {
  -- your personnal icons can go here (to override)
  -- you can specify color or cterm_color instead of specifying both of them
  -- DevIcon will be appended to `name`
  override = {
    heex = {
      icon = "",
      color = "#a074c4",
      cterm_color = "140",
      name = "Eex",
    },
    ex = {
      icon = "",
      color = "#a074c4",
      cterm_color = "140",
      name = "Ex",
    }
  };
  -- globally enable default icons (default to false)
  -- will get overriden by `get_icons` option
  default = true;
}
