local gl = require('galaxyline')
local utils = require('utils')
local default_colors = require('galaxyline.theme').default
local condition = require('galaxyline.condition')
local gls = gl.section
gl.short_line_list = { 'NvimTree', 'vista', 'dbui', 'packer' }

local extra_colors = {
  red = "#e95678",
  redwine = "#d16d9e",
  orange = "#FF8700",
  yellow = "#f7bb3b",
  lignt_orange = "#fab795",
  green = "#afd700",
  dark_green = "#98be65",
  cyan = "#36d0e0",
  blue = "#61afef",
  violet = "#CBA6F7",
  magenta = "#c678dd",
  teal = "#1abc9c",
  grey = "#928374",
  brown = "#c78665",
}

local colors = utils.merge_table(default_colors, extra_colors)

gls.left[1] = {
  RainbowRed = {
    provider = function() return '▊ ' end,
    highlight = { colors.blue, colors.bg }
  },
}
gls.left[2] = {
  ViMode = {
    provider = function()
      -- auto change color according the vim mode
      local mode_color = {
        n = colors.red, i = colors.green, v = colors.blue,
        [''] = colors.blue, V = colors.blue,
        c = colors.magenta, no = colors.red, s = colors.orange,
        S = colors.orange, [''] = colors.orange,
        ic = colors.yellow, R = colors.violet, Rv = colors.violet,
        cv = colors.red, ce = colors.red, r = colors.cyan,
        rm = colors.cyan, ['r?'] = colors.cyan,
        ['!'] = colors.red, t = colors.red
      }
      vim.api.nvim_command('hi GalaxyViMode guifg=' .. mode_color[vim.fn.mode()])
      return '  '
    end,
    highlight = { colors.red, colors.bg, 'bold' },
  },
}

gls.left[3] = {
  GitBranch = {
    icon                = '  ',
    provider            = function()
      local vcs = require('galaxyline.provider_vcs')
      local branch = vcs.get_git_branch()
      if vim.fn.empty(branch) == 1 then return '' end
      return branch .. ' '
    end,
    condition           = condition.check_git_workspace,
    highlight           = { colors.redwine, colors.bg, 'bold' },
    -- separator           = '▎',
    separator           = '❯',
    separator_highlight = { colors.green, colors.bg }
  }
}


gls.left[4] = {
  FileName = {
    provider  = function()
      local filepath = vim.fn.fnamemodify(vim.fn.expand '%', ':~:.')
      if vim.fn.empty(filepath) == 1 then return '' end
      return ' ' .. filepath .. ' '
    end,
    condition = condition.buffer_not_empty,
    highlight = { colors.yellow, colors.bg, 'bold' },
  }
}


gls.left[5] = {
  DiagnosticError = {
    provider = 'DiagnosticError',
    icon = '  ',
    highlight = { colors.red, colors.bg }
  }
}
gls.left[5] = {
  DiagnosticWarn = {
    provider = 'DiagnosticWarn',
    icon = '  ',
    highlight = { colors.yellow, colors.bg },
  }
}

gls.left[6] = {
  DiagnosticHint = {
    provider = 'DiagnosticHint',
    icon = '  ',
    highlight = { colors.cyan, colors.bg },
  }
}

gls.left[7] = {
  DiagnosticInfo = {
    provider = 'DiagnosticInfo',
    icon = '  ',
    highlight = { colors.blue, colors.bg },
  }
}

gls.mid[1] = {
  ShowLspClient = {
    provider = 'GetLspClient',
    condition = function()
      local tbl = { ['dashboard'] = true, [''] = true }
      if tbl[vim.bo.filetype] then
        return false
      end
      return true
    end,
    icon = ' lsp:',
    highlight = { colors.cyan, colors.bg }
  }
}

-- gls.right[1] = {
--   RightStartsFlag = {
--     provider = function() return '▎' end,
--     highlight = { colors.blue, colors.bg }
--   },
-- }



gls.right[3] = {
  DiffAdd = {
    provider = 'DiffAdd',
    condition = condition.hide_in_width,
    icon = '  ',
    highlight = { colors.green, colors.bg },
  }
}
gls.right[4] = {
  DiffModified = {
    provider = 'DiffModified',
    condition = condition.hide_in_width,
    icon = '  ',
    highlight = { colors.orange, colors.bg },
  }
}
gls.right[5] = {
  DiffRemove = {
    provider = 'DiffRemove',
    condition = condition.hide_in_width,
    icon = '  ',
    highlight = { colors.red, colors.bg },
  }
}

gls.right[6] = {
  FileEncode = {
    provider = 'FileEncode',
    condition = condition.hide_in_width,
    separator = ' ',
    separator_highlight = { 'NONE', colors.bg },
    highlight = { colors.blue, colors.bg, 'bold' }
  }
}


gls.right[7] = {
  FileFormat = {
    provider = 'FileFormat',
    condition = condition.hide_in_width,
    separator = ' ',
    separator_highlight = { 'NONE', colors.bg },
    highlight = { colors.red, colors.bg, 'bold' }
  }
}

gls.right[8] = {
  PerCent = {
    provider = 'LinePercent',
    separator = ' ',
    separator_highlight = { 'NONE', colors.bg },
    highlight = { colors.fg, colors.bg, 'bold' },
  }
}

gls.right[9] = {
  RainbowBlue = {
    provider = function() return ' ▊' end,
    highlight = { colors.blue, colors.bg }
  },
}

gls.short_line_left[1] = {
  BufferType = {
    provider = 'FileTypeName',
    separator = ' ',
    separator_highlight = { 'NONE', colors.bg },
    highlight = { colors.blue, colors.bg, 'bold' }
  }
}

gls.short_line_left[2] = {
  SFileName = {
    provider = 'SFileName',
    condition = condition.buffer_not_empty,
    highlight = { colors.fg, colors.bg, 'bold' }
  }
}

gls.short_line_right[1] = {
  BufferIcon = {
    provider = 'BufferIcon',
    highlight = { colors.fg, colors.bg }
  }
}
