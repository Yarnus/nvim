local M = {}

M.map = function(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  local stat, error = pcall(vim.api.nvim_set_keymap, mode, lhs, rhs, options)
  if not stat then
    vim.notify(error, vim.log.levels.ERROR, { title = 'keymap' })
  end
end

M.require = function(name, message)
  local status_ok, plugin = pcall(require, name)
  if not status_ok and message ~= false then
    local info = debug.getinfo(2, "Sl")
    local file = info.short_src
    local line = info.currentline
    local _hint = "require: Failed to load '%s'\n(%s: %d)"
    local hint = _hint:format(name, file, line)
    vim.notify(hint, vim.log.levels.WARN)
    return nil
  else
    if status_ok and plugin ~= true then
      return plugin
    end
  end
  return nil
end

M.cmd = function(str)
  return '<cmd>' .. str .. '<CR>'
end

M.new_cmd = function(cmd, repl, force)
  local command
  if force then
    command = 'command! ' .. cmd .. ' ' .. repl
  else
    command = 'command ' .. cmd .. ' ' .. repl
  end
  local ok, err = pcall(vim.cmd, command)
  if not ok then
    vim.notify('setting cmd: ' .. cmd .. ' ' .. err, vim.log.levels.ERROR, { title = 'command' })
  end
end

M.log_err = function(msg, title)
  vim.notify(msg, vim.log.levels.ERROR, { title = title })
end

M.log_info = function(msg, title)
  vim.notify(msg, vim.log.levels.INFO, { title = title })
end

M.merge_table = function(t1, t2)
  for k, v in pairs(t2) do
    t1[k] = v
  end
  return t1
end

return M
