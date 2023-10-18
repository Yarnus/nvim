local lualine = require('lualine')
local utils = require('utils')

-- local default_colors = require("gruvbox-baby.colors").config()
-- local default_colors = {}
local default_colors = require("everforest.colours")

local extra_colors = {
  -- red = "#e95678",
  red          = '#ec5f67',
  redwine      = "#d16d9e",
  orange       = "#FF8700",
  yellow       = "#f7bb3b",
  lignt_orange = "#fab795",
  green        = "#afd700",
  dark_green   = "#98be65",
  cyan         = '#008080',
  blue         = '#51afef',
  violet       = "#CBA6F7",
  magenta      = "#c678dd",
  teal         = "#1abc9c",
  grey         = "#928374",
  brown        = "#c78665",
  bg           = default_colors.background,
  fg           = default_colors.foreground
}


local colors = utils.merge_table(default_colors, extra_colors)

local conditions = {
  buffer_not_empty = function()
    return vim.fn.empty(vim.fn.expand('%:t')) ~= 1
  end,
  hide_in_width = function()
    return vim.fn.winwidth(0) > 80
  end,
  check_git_workspace = function()
    local filepath = vim.fn.expand('%:p:h')
    local gitdir = vim.fn.finddir('.git', filepath .. ';')
    return gitdir and #gitdir > 0 and #gitdir < #filepath
  end,
}

local config = {
  options = {
    -- Disable sections and component separators
    component_separators = '',
    section_separators = '',
    icons_enabled = true,
    -- theme = "everforest",
    -- theme = {
    --   -- We are going to use lualine_c an lualine_x as left and
    --   -- right section. Both are highlighted by c theme .  So we
    --   -- are just setting default looks o statusline
    --   normal = { c = { fg = colors.fg, bg = colors.bg } },
    --   inactive = { c = { fg = colors.fg, bg = colors.bg } },
    -- },
    globalstatus = true,
    ignore_focus = { "NvimTree" }
  },
  sections = {
    -- these are to remove the defaults
    lualine_a = {},
    lualine_b = {},
    lualine_y = {},
    lualine_z = {},
    -- These will be filled later
    lualine_c = {},
    lualine_x = {},
  },
  inactive_sections = {
    -- these are to remove the defaults
    lualine_a = {},
    lualine_b = {},
    lualine_y = {},
    lualine_z = {},
    lualine_c = {},
    lualine_x = {},
  },
}

-- Inserts a component in lualine_c at left section
local function ins_left(component)
  table.insert(config.sections.lualine_c, component)
end

-- Inserts a component in lualine_x at right section
local function ins_right(component)
  table.insert(config.sections.lualine_x, component)
end

ins_left {
  function()
    return '▊'
  end,
  color = { fg = colors.blue },      -- Sets highlighting of component
  padding = { left = 0, right = 1 }, -- We don't need space before this
}

ins_left {
  -- mode component
  function()
    return ''
  end,
  color = function()
    -- auto change color according to neovims mode
    local mode_color = {
      n = colors.red,
      i = colors.green,
      v = colors.blue,
      [''] = colors.blue,
      V = colors.blue,
      c = colors.magenta,
      no = colors.red,
      s = colors.orange,
      S = colors.orange,
      [''] = colors.orange,
      ic = colors.yellow,
      R = colors.violet,
      Rv = colors.violet,
      cv = colors.red,
      ce = colors.red,
      r = colors.cyan,
      rm = colors.cyan,
      ['r?'] = colors.cyan,
      ['!'] = colors.red,
      t = colors.red,
    }
    return { fg = mode_color[vim.fn.mode()] }
  end,
  padding = { right = 1 },
}

ins_left {
  'branch',
  icon  = '',
  color = { fg = colors.yellow, gui = '' },
  -- separator           = '❯',
}

ins_left {
  'filesize',
  color = { fg = colors.redwine },
  cond = conditions.buffer_not_empty,
}

-- 0: Just the filename
-- 1: Relative path
-- 2: Absolute path
-- 3: Absolute path, with tilde as the home directory
-- 4: Filename and parent dir, with tilde as the home directory
ins_left {
  'filename', path = 4, file_status = false,
  cond = conditions.buffer_not_empty,
  color = { fg = colors.teal, gui = '' },
}


ins_left {
  'diagnostics',
  sources = { 'nvim_diagnostic' },
  cond = conditions.hide_in_width,
  symbols = { error = '  ', warn = '  ', info = '  ' },
  diagnostics_color = {
    color_error = { fg = colors.red },
    color_warn = { fg = colors.yellow },
    color_info = { fg = colors.cyan },
  },
}

-- Insert mid section. You can make any number of sections in neovim :)
-- for lualine it's any number greater then 2
ins_left {
  function()
    return '%='
  end,
}


ins_left {
  -- Lsp server name .
  function()
    local msg = 'nil'
    local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
    local clients = vim.lsp.get_active_clients()
    if next(clients) == nil then
      return msg
    end
    for _, client in ipairs(clients) do
      local filetypes = client.config.filetypes
      if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
        return client.name
      end
    end
    return msg
  end,
  icon = ' lsp:',
  color = { fg = colors.lignt_orange, gui = '' },
}

-- Add components to right sections

ins_right {
  'diff',
  -- Is it me or the symbol for modified us really weird
  symbols = { added = '  ', modified = '  ', removed = '  ' },
  diff_color = {
    added = { fg = colors.green },
    modified = { fg = colors.orange },
    removed = { fg = colors.red },
  },
  cond = conditions.hide_in_width,
}



ins_right {
  'o:encoding',       -- option component same as &encoding in viml
  fmt = string.upper, -- I'm not sure why it's upper case either ;)
  cond = conditions.hide_in_width,
  color = { fg = colors.brown, gui = '' },
}

ins_right {
  'fileformat',
  fmt = string.upper,
  icons_enabled = false, -- I think icons are cool but Eviline doesn't have them. sigh
  color = { fg = colors.red, gui = '' },
}

ins_right { 'progress', color = { fg = colors.green, gui = '' } }

ins_right {
  function()
    return '▊'
  end,
  color = { fg = colors.blue },
  padding = { left = 1 },
}

lualine.setup(config)
