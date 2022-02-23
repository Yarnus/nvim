if vim.g.galaxyline_loaded ~= nil then
  return
end

vim.g.galaxyline_loaded = 1

local gl = require('galaxyline')
local gls = gl.section
local diagnostic = require('galaxyline.provider_diagnostic')
local condition = require('galaxyline.condition')
local vim = vim

gl.short_line_list = {
    'LuaTree', 'vista', 'dbui', 'startify', 'term', 'nerdtree', 'fugitive',
    'fugitiveblame', 'plug', 'NvimTree'
}


-- common
-- colors = {
--     bg       = '#504945',
--     -- hi StatusLine - guibg
--     line_bg  = '#202020',
--     fg       = '#8FBCBB',
--     fg_green = '#65a380',
--     yellow   = '#fabd2f',
--     cyan     = '#86c1b9',
--     darkblue = '#1d2021',
--     green    = '#a1b56c',
--     orange   = '#dc9656',
--     purple   = '#5d4d7a',
--     magenta  = '#d3869b',
--     blue     = '#7cafc2',
--     red      = '#fb4934',
--     violet   = '#ba8baf'
-- }

-- gruvbox-baby
colors = {
    bg       = '#504945',
    line_bg  = '#202020',
    fg       = '#8FBCBB',
    fg_green = '#689d6a',
    yellow   = '#fabd2f',
    cyan     = '#86c1b9',
    darkblue = '#1d2021',
    green    = '#8ec07c',
    orange   = '#d65d0e',
    purple   = '#5d4d7a',
    magenta  = '#b16286',
    blue     = '#7cafc2',
    red      = '#fb4934',
    violet   = '#D4879C'
}


local function has_file_type()
    local f_type = vim.bo.filetype
    if not f_type or f_type == '' then return false end
    return true
end

local buffer_not_empty = function()
    if vim.fn.empty(vim.fn.expand('%:t')) ~= 1 then return true end
    return false
end

-- insert_left insert item at the left panel
local function insert_left(element)
  table.insert(gls.left, element)
end

-- insert_blank_line_at_left insert blank line with
-- line_bg color.
local function insert_blank_line_at_left()
    insert_left {
        Space = {
            provider = function() return ' ' end,
            highlight = {colors.line_bg, colors.line_bg}
        }
    }
end

local function insert_separator_at_left(separator)
    insert_blank_line_at_left()
    insert_left {
        Separator = {
            provider = function() return separator end,
            highlight = {colors.orange, colors.line_bg}
        }
    }
    insert_blank_line_at_left()
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
            highlight = {colors.line_bg, colors.line_bg}
        }
    }
end

local function insert_separator_at_right(separator)
    insert_blank_line_at_right()
    insert_right {
        Separator = {
            provider = function() return separator end,
            highlight = {colors.orange, colors.line_bg}
        }
    }
    insert_blank_line_at_right()
end



local checkwidth = function()
    local squeeze_width = vim.fn.winwidth(0) / 2
    if squeeze_width > 40 then return true end
    return false
end


insert_blank_line_at_left()

insert_left {
    ViMode = {
        icon = function()
            local icons = {
                n = ' ',
                i = ' ',
                c = 'ﲵ ',
                V = ' ',
                [''] = ' ',
                v = ' ',
                C = 'ﲵ ',
                R = '﯒ ',
                t = ' '
            }
            return icons[vim.fn.mode()]
        end,
        provider = function()
            -- auto change color according the vim mode
            local alias = {
                n = 'NORMAL',
                i = 'INSERT',
                c = 'COMMAND',
                V = 'VISUAL LINE',
                [''] = 'VISUAL',
                v = 'VISUAL',
                C = 'COMMAND',
                ['r?'] = ':CONFIRM',
                rm = '--MORE',
                R = 'REPLACE',
                Rv = 'R&V',
                s = 'S',
                S = 'S',
                ['r'] = 'HIT-ENTER',
                [''] = 'SELECT',
                t = 'T',
                ['!'] = 'SH',
                ['V?'] = 'VISUAL BLOCK',
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
                [''] = colors.orange,
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
            vim.api.nvim_command('hi GalaxyViMode guifg=' ..color)
            return alias[vim_mode]
        end,
        highlight = {colors.line_bg, colors.line_bg}
    }
}

insert_separator_at_left('▊')

insert_left {
    GitIcon = {
      provider  = function() return '  ' end,
      condition = condition.check_git_workspace,
      highlight = {colors.orange, colors.line_bg}
    }
}
insert_left {
    GitBranch = {
      provider  = 'GitBranch',
      condition = condition.check_git_workspace,
      highlight = {colors.red, colors.line_bg},
    }
}

insert_blank_line_at_left()

insert_left {
  DiffAdd = {
    provider = 'DiffAdd',
    condition = condition.hide_in_width,
    icon = '  ',
    highlight = {colors.green,colors.line_bg},
  }
}

insert_left {
  DiffModified = {
    provider = 'DiffModified',
    condition = condition.hide_in_width,
    icon = '  ',
    highlight = {colors.orange,colors.line_bg},
  }
}

insert_left {
    DiffRemove = {
    provider = 'DiffRemove',
    condition = condition.hide_in_width,
    icon = '  ',
    highlight = {colors.red,colors.line_bg},
  }
}

insert_blank_line_at_left()

insert_left{
    FileIcon = {
        provider = 'FileIcon',
        condition = buffer_not_empty,
        highlight = {
            require('galaxyline.provider_fileinfo').get_file_icon_color, colors.line_bg
        }
    }
}

insert_left {
  FilePath = {
    provider= function ()
      local filepath = vim.fn.fnamemodify(vim.fn.expand '%', ':~:.')
      if vim.fn.empty(filepath) == 1 then return '' end
      return filepath
    end,
    condition = condition.buffer_not_empty,
    highlight = {colors.yellow, colors.line_bg},
  }
}

local DiagnosticError = diagnostic.get_diagnostic_error
local DiagnosticWarn = diagnostic.get_diagnostic_warn
local DiagnosticHint = diagnostic.get_diagnostic_hint
local DiagnosticInfo = diagnostic.get_diagnostic_info

-- right
insert_right{
   ShowLspClient = {
    provider = 'GetLspClient',
    condition = function ()
      local tbl = {['dashboard'] = true, ['']=true }
      if tbl[vim.bo.filetype] then
        return false
      end
      return true
    end,
    icon = ' ',
    highlight = {colors.green, colors.line_bg}
  }
}

insert_separator_at_right(' ')


insert_right {
    PerCent = {
    provider = 'LinePercent',
    highlight = {colors.yellow, colors.line_bg},
  }
}

insert_blank_line_at_right()

insert_right {
    FileEncode = {
    provider = 'FileEncode',
    condition = condition.hide_in_width,
    highlight = {colors.orange, colors.line_bg}
  }
}

insert_blank_line_at_right()

insert_right {
    FileFormat = {
    provider = 'FileFormat',
    condition = condition.hide_in_width,
    highlight = {colors.violet, colors.line_bg}
  }
}

insert_blank_line_at_right()

insert_right {
  BufferType = {
    provider = 'FileTypeName',
    highlight = { colors.fg_green, colors.line_bg },
  }
}

insert_separator_at_right(' ')

