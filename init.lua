--- load basic configuration
local utils = require('utils')

for _, module_name in ipairs({ 'options', 'keymaps', 'commands', 'events' }) do
  local ok, err = pcall(require, module_name)
  if not ok then
    local msg = 'calling module: ' .. module_name .. ' fail: ' .. err
    utils.log_err(msg)
  end
end

utils.load_plugins()
