local db = require('dashboard')
db.setup({
  change_to_vcs_root = true, -- 启用切换到版本控制系统根目录
  theme = 'hyper',
  config = {
    week_header = { enable = true },
    shortcut = {
      { desc = '󰊳 Update', group = '@property', action = 'Lazy update', key = 'u' },
      {
        icon = ' ',
        icon_hl = '@variable',
        desc = 'Files',
        group = 'Label',
        action = 'FzfLua files',
        key = 'f',
      },
      {
        desc = ' Projects',
        group = 'Number',
        action = function()
          require('fzf-lua').fzf_exec(
            'find ~ -maxdepth 3 -type d -name ".git" | sed "s/\\.git$//"',
            {
              prompt = "Projects> ",
              actions = {
                ["default"] = function(selected)
                  local dir = selected[1]
                  vim.cmd('cd ' .. vim.fn.fnameescape(dir))
                  require('fzf-lua').files({ cwd = dir })
                end
              },
              winopts = {
                height = 0.85,
                width = 0.80,
                row = 0.35,
                col = 0.50,
                border = "rounded",
              }
            }
          )
        end,
        key = 'p',
      },
      {
        desc = ' Recent Files',
        group = 'String',
        action = 'FzfLua oldfiles',
        key = 'r',
      },
    },
    project = {
      enable = true,
      limit = 8,
      icon = ' ',
      label = 'Recent Projects:',
      action = 'FzfLua files cwd=',
    },
    mru = {
      enable = false,
      limit = 10,
      icon = ' ',
      label = 'Most Recent Files:',
    },
  },
})
