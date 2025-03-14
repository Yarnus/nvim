local map = require('utils').map
local cmd = require('utils').cmd
-- local map = vim.api.nvim_set_keymap
--
-- custom
map('n', '<esc>', ':noh<return><esc>')
map('n', '<C-s>', cmd('write'))
-- windows
map('n', '<C-j>', '<C-w>j')
map('n', '<C-k>', '<C-w>k')
map('n', '<C-l>', '<C-w>l')
map('n', '<C-h>', '<C-w>h')
map('n', '<C-up>', cmd(':res -5'))
map('n', '<C-down>', cmd(':res +5'))
map('n', '<C-left>', cmd(':vertical resize -5'))
map('n', '<C-right>', cmd(':vertical resize +5'))

-- buffer
map('n', '-', cmd(':bd'))
map('n', '=', cmd(':bn'))
map('n', '<Tab>', cmd(':bnext'))
map('n', '<S-Tab>', cmd(':bprevious'))

map('c', '<C-a>', cmd('<Home>'))
map('c', '<C-e>', cmd('<End>'))

-- easyalign
map('v', '<leader>e', cmd(':EasyAlign'))

-- nvimtree
map('n', '<C-n>', cmd(':NvimTreeToggle'))

-- fzf-lua
map('n', '<C-p>', cmd(':FzfLua files'))
map('n', '<LEADER>ff', cmd(':FzfLua live_grep'))
map('n', '<LEADER>fc', cmd(':FzfLua grep_cword'))

map('i', '<C-a>', '<Home>')
map('i', '<C-e>', '<End>')
map('c', '<C-a>', '<Home>')
map('c', '<C-e>', '<End>')
