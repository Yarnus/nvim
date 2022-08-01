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

return M
