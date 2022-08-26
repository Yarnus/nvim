-- load basic configuration
local utils = require('utils')

-- NOTE: remode command due to i used to set-up them base on config
for _, module_name in ipairs({ 'options', 'keymaps', 'commands', 'events' }) do
  local ok, err = pcall(require, module_name)
  if not ok then
    local msg = 'calling module: ' .. module_name .. ' fail: ' .. err
    utils.log_err(msg)
  end
end

vim.g.loaded_gzip = 1
vim.g.loaded_tar = 1
vim.g.loaded_tarPlugin = 1
vim.g.loaded_zip = 1
vim.g.loaded_zipPlugin = 1
vim.g.loaded_getscript = 1
vim.g.loaded_getscriptPlugin = 1
vim.g.loaded_vimball = 1
vim.g.loaded_vimballPlugin = 1
vim.g.loaded_matchit = 1
vim.g.loaded_matchparen = 1
vim.g.loaded_2html_plugin = 1
vim.g.loaded_logiPat = 1
vim.g.loaded_rrhelper = 1
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrwSettings = 1
vim.g.loaded_netrwFileHandlers = 1

utils.load_plugins()
