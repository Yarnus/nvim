local map = require('utils').map
-- local map = vim.api.nvim_set_keymap
--
-- custom
map('n', '<esc>', ':noh<return><esc>')

-- windows
map('n', '<C-j>', '<C-w>j')
map('n', '<C-k>', '<C-w>k')
map('n', '<C-l>', '<C-w>l')
map('n', '<C-h>', '<C-w>h')
map('n', '<C-up>', ':res -5<CR>')
map('n', '<C-down>', ':res +5<CR>')
map('n', '<C-left>', ':vertical resize -5<CR>')
map('n', '<C-right>', ':vertical resize +5<CR>')

-- buffer
map('n', '-', ':bd<CR>')
map('n', '=', ':bn<CR>')
map('n', '<Tab>', ':bnext<CR>')
map('n', '<S-Tab>', ':bprevious<CR>')

map('c', '<C-a>', '<Home>')
map('c', '<C-e>', '<End>')

-- easyalign
map("v", "<leader>e", ":EasyAlign<CR>")

-- nvim-tree
map("n", "<C-n>", ":NvimTreeToggle<CR>")

map("n", "<C-p>", [[:lua require('telescope.builtin').find_files{}<CR>]])
map("n", "<LEADER>ff", [[:lua require('telescope.builtin').live_grep{}<CR>]])
