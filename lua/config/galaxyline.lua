local utils = require "utils"
local vim = vim

if vim.g.galaxyline_loaded ~= nil then
  return
end

vim.g.galaxyline_loaded = 1

local gl = require('galaxyline')
local gls = gl.section
local condition = require('galaxyline.condition')

gl.short_line_list = {
  'LuaTree', 'vista', 'dbui', 'startify', 'term', 'nerdtree', 'fugitive',
  'fugitiveblame', 'plug', 'NvimTree', 'neo-tree'
}

local theme_colors = require("gruvbox-baby.colors")

local base_colors = {
  bg       = '#504945',
  -- hi StatusLine - guibg
  line_bg  = '202020',
  fg       = '#8FBCBB',
  fg_green = '#65a380',
  yellow   = '#fabd2f',
  cyan     = '#86c1b9',
  darkblue = '#1d2021',
  -- green = "#08cd7d",
  green    = '#8ec07c',
  orange   = '#dc9656',
  purple   = '#5d4d7a',
  magenta  = '#d3869b',
  blue     = '#7cafc2',
  red      = '#fb4934',
  violet   = '#ba8baf'
}

local function mixin_colors(base, extra)
  for k, v in pairs(extra) do
    base[k] = v
  end

  return base
end

local colors = mixin_colors(base_colors, theme_colors)
-- common
--
--
-- local colors = {
--   bg       = '#504945',
--   line_bg  = '393f44',
--   fg       = '#8FBCBB',
--   fg_green = '#689d6a',
--   yellow   = '#e5c07b',
--   cyan     = '#86c1b9',
--   darkblue = '#1d2021',
--   green    = '#8ec07c',
--   orange   = '#d19a66',
--   purple   = '#5d4d7a',
--   magenta  = '#b16286',
--   blue     = '#7cafc2',
--   red      = '#e86671',
--   violet   = '#D4879C'
-- }

-- local function has_file_type()
--   local f_type = vim.bo.filetype
--   if not f_type or f_type == '' then return false end
--   return true
-- end

local buffer_not_empty = function()
  if vim.fn.empty(vim.fn.expand('%:t')) ~= 1 then return true end
  return false
end

-- insert_left insert item at the left panel
local function insert_left(element)
  table.insert(gls.left, element)
end

-- insert_blank_line_at_left insert blank line with line_bg color.
local function insert_blank_line_at_left()
  insert_left {
    Space = {
      provider = function() return ' ' end,
      highlight = { colors.line_bg, colors.line_bg }
    }
  }
end

-- insert_right insert given item into galaxyline.right
local function insert_right(element)
  table.insert(gls.right, element)
end

-- insert_blank_line_at_left insert blank line with line_bg color.
local function insert_blank_line_at_right()
  insert_right {
    Space = {
      provider = function() return ' ' end,
      highlight = { colors.line_bg, colors.line_bg }
    }
  }
end

local function insert_separator_at_right(separator)
  insert_blank_line_at_right()
  insert_right {
    Separator = {
      provider = function() return separator end,
      highlight = { colors.orange, colors.line_bg }
    }
  }
  insert_blank_line_at_right()
end

insert_blank_line_at_left()

insert_left {
  ViMode = {
    -- icon = function()
    --   local icons = {
    --     n = ' ',
    --     i = ' ',
    --     c = 'ﲵ ',
    --     V = ' ',
    --     [''] = ' ',
    --     v = ' ',
    --     C = 'ﲵ ',
    --     R = '﯒ ',
    --     t = ' '
    --   }
    --   return icons[vim.fn.mode()]
    -- end,
    provider = function()
      -- auto change color according the vim mode
      local alias = {
        n = 'Normal',
        i = 'Insert',
        c = 'Command',
        V = 'Visual Line',
        [''] = 'Visual',
        v = 'Visual',
        C = 'Command',
        ['r?'] = ':Confirm',
        rm = '--More',
        R = 'Repalce',
        Rv = 'R&V',
        s = 'S',
        S = 'S',
        ['r'] = 'HIT-ENTER',
        t = 'T',
        ['!'] = 'SH',
        ['V?'] = 'visual block',
      }

      local mode_color = {
        n = colors.yellow,
        i = colors.green,
        v = colors.blue,
        [''] = colors.blue,
        V = colors.blue,
        c = colors.magenta,
        no = colors.red,
        s = colors.orange,
        S = colors.orange,
        ic = colors.yellow,
        R = colors.purple,
        Rv = colors.purple,
        cv = colors.red,
        ce = colors.red,
        r = colors.cyan,
        rm = colors.cyan,
        ['r?'] = colors.cyan,
        ['!'] = colors.red,
        t = colors.red
      }

      local vim_mode = vim.fn.mode()
      local color = mode_color[vim_mode] or colors.red
      vim.api.nvim_command('hi GalaxyViMode guifg=' .. color)
      return alias[vim_mode]
    end,
    highlight = { colors.line_bg, colors.line_bg },
    separator = ' '
  }
}

-- insert_blank_line_at_left()
--
-- insert_left {
--   GitIcon = {
--     provider  = function() return ' ' end,
--     condition = condition.check_git_workspace,
--     highlight = { colors.purple, colors.line_bg },
--   }
-- }

insert_left {
  GitBranch = {
    provider  = 'GitBranch',
    condition = condition.check_git_workspace,
    highlight = { colors.cyan, colors.line_bg },
    separator = ' ',
    icon = ' '
  },
}

-- insert_blank_line_at_left()

-- insert_left {
--   FileIcon = {
--     provider = 'FileIcon',
--     condition = buffer_not_empty,
--     highlight = {
--       require('galaxyline.providers.fileinfo').get_file_icon_color, colors.line_bg
--     }
--   }
-- }
--

insert_left {
  FileIndicator = {
    provider  = function() return ' ' end,
    condition = condition.buffer_not_empty,
    highlight = { colors.violet, colors.line_bg }
  }
}

insert_left {
  FilePath = {
    provider = function()
      local filepath = vim.fn.fnamemodify(vim.fn.expand '%', ':~:.')
      if vim.fn.empty(filepath) == 1 then return '' end
      return filepath
    end,
    condition = condition.buffer_not_empty,
    highlight = { colors.orange, colors.line_bg },
  }
}

-- right --

insert_right {
  DiffAdd = {
    provider = 'DiffAdd',
    condition = condition.hide_in_width,
    icon = '  ',
    highlight = { colors.green, colors.line_bg },
  }
}

insert_right {
  DiffModified = {
    provider = 'DiffModified',
    condition = condition.hide_in_width,
    icon = '  ',
    highlight = { colors.orange, colors.line_bg },
  }
}

insert_right {
  DiffRemove = {
    provider = 'DiffRemove',
    condition = condition.hide_in_width,
    icon = '  ',
    highlight = { colors.red, colors.line_bg },
  }
}

insert_blank_line_at_right()


insert_right {
  ShowLspClient = {
    provider = 'GetLspClient',
    condition = function()
      local tbl = { ['dashboard'] = true, [''] = true }
      if tbl[vim.bo.filetype] then
        return false
      end
      return true
    end,
    icon = 'ﲳ ',
    highlight = { colors.blue, colors.line_bg }
  }
}

insert_separator_at_right(' ')


insert_right {
  PerCent = {
    provider = 'LinePercent',
    highlight = { colors.green, colors.line_bg },
  }
}

insert_blank_line_at_right()

insert_right {
  FileEncode = {
    provider = 'FileEncode',
    condition = condition.hide_in_width,
    highlight = { colors.orange, colors.line_bg }
  }
}

insert_blank_line_at_right()

insert_right {
  FileFormat = {
    provider = 'FileFormat',
    condition = condition.hide_in_width,
    highlight = { colors.violet, colors.line_bg }
  }
}

insert_blank_line_at_right()

insert_right {
  BufferType = {
    provider = 'FileTypeName',
    highlight = { colors.yellow, colors.line_bg },
  }
}

insert_separator_at_right(' ')
