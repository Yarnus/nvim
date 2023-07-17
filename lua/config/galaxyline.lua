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

local colors = require('galaxyline.theme').default

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
      highlight = { colors.yellow, colors.line_bg }
    }
  }
  insert_blank_line_at_right()
end

insert_left {
  ViMode = {
    icon = "▌",
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
      -- vim.api.nvim_command('hi GalaxyViMode guifg=' .. color)
      return alias[vim_mode]
    end,
    highlight = { colors.line_bg, colors.bg },
    separator = ' ',
    separator_highlight = { colors.bg, colors.yellow }
  }
}

insert_left {
  GitBranch = {
    provider  = 'GitBranch',
    condition = condition.check_git_workspace,
    separator = ' ',
    icon      = '  '
  },
}

insert_left {
  File = {
    provider  = function()
      local filepath = vim.fn.fnamemodify(vim.fn.expand '%', ':~:.')
      if vim.fn.empty(filepath) == 1 then return '' end
      return ' ' .. filepath
    end,
    -- provider  = 'FileName',
    condition = condition.buffer_not_empty,
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
    icon = ' ',
    highlight = { colors.yellow, colors.line_bg },
  }
}

insert_separator_at_right('▌')

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
    highlight = { colors.violet, colors.line_bg },
  }
}

insert_separator_at_right('▌')

insert_right {
  BufferType = {
    provider = 'FileTypeName',
    highlight = { colors.yellow, colors.line_bg },
  }
}
