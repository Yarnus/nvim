local nightfox = require('nightfox')

nightfox.setup(
  {
    fox = "nordforx", -- Which fox style should be applied
    transparent = false, -- Disable setting the background color
    alt_nc = false, -- Non current window bg to alt color see `hl-NormalNC`
    terminal_colors = true, -- Configure the colors used when opening :terminal
    styles = {
      comments = "NONE", -- Style that is applied to comments: see `highlight-args` for options
      functions = "italic", -- Style that is applied to functions: see `highlight-args` for options
      keywords = "NONE", -- Style that is applied to keywords: see `highlight-args` for options
      strings = "NONE", -- Style that is applied to strings: see `highlight-args` for options
      variables = "NONE", -- Style that is applied to variables: see `highlight-args` for options
    },
    inverse = {
      match_paren = false, -- Enable/Disable inverse highlighting for match parens
      visual = true, -- Enable/Disable inverse highlighting for visual selection
      search = false, -- Enable/Disable inverse highlights for search highlights
    },
    colors = {}, -- Override default colors
    hlgroups = {}, -- Override highlight groups
  }
)

nightfox.load()
