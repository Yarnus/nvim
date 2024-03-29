require('nvim-autopairs').setup({ enable_check_bracket_line = false })

local npairs = require('nvim-autopairs')
local Rule = require('nvim-autopairs.rule')

npairs.setup({
  check_ts = true,
  ts_config = {
    lua = { 'string' }, -- it will not add pair on that treesitter node
    javascript = { 'template_string' },
    java = false -- don't check treesitter on java
  },
  fast_wrap = {
    map = '\\e',
    chars = { '{', '[', '(', '"', "'" },
    pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], '%s+', ''),
    end_key = '$',
    keys = 'qwertyuiopzxcvbnmasdfghjkl',
    check_comma = true,
    hightlight = 'Search'
  }
})

npairs.add_rules({
  Rule(' ', ' '):with_pair(function(opts)
    local pair = opts.line:sub(opts.col - 1, opts.col)
    return vim.tbl_contains({ '()', '[]', '{}' }, pair)
  end), Rule('( ', ' )'):with_pair(function() return false end):with_move(
    function(opts) return opts.prev_char:match('.%)') ~= nil end):use_key(
    ')'),
  Rule('{ ', ' }'):with_pair(function() return false end):with_move(
    function(opts) return opts.prev_char:match('.%}') ~= nil end):use_key(
    '}'), Rule('[ ', ' ]'):with_pair(function() return false end):with_move(
    function(opts) return opts.prev_char:match('.%]') ~= nil end):use_key(
    ']')
})
