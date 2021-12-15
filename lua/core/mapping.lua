local bind = require("keymap.bind")
local map_cr = bind.map_cr
local map_cu = bind.map_cu
local map_cmd = bind.map_cmd

-- default map
local def_map = {
    -- Vim map

    ["n|<C-h>"] = map_cmd("<C-w>h"):with_noremap(),
    ["n|<C-l>"] = map_cmd("<C-w>l"):with_noremap(),
    ["n|<C-j>"] = map_cmd("<C-w>j"):with_noremap(),
    ["n|<C-k>"] = map_cmd("<C-w>k"):with_noremap(),
    ["n|<C-left>"] = map_cr("vertical resize -5"):with_silent(),
    ["n|<C-right>"] = map_cr("vertical resize +5"):with_silent(),
    ["n|<C-up"] = map_cr("resize -2"):with_silent(),
    ["n|<C-down"] = map_cr("resize +2"):with_silent(),
    ["n|-"] = map_cmd(":bd<CR>"):with_noremap():with_silent(),
    ["n|="] = map_cmd(":enew<CR>"):with_noremap():with_silent(),
    ["n|<Tab>"] = map_cmd(":bnext<CR>"):with_noremap():with_silent(),
    ["n|<S-Tab>"] = map_cmd(":bprevious<CR>"):with_noremap():with_silent(),
    -- Insert
    ["i|<C-u>"] = map_cmd("<C-G>u<C-U>"):with_noremap(),
    ["i|<C-b>"] = map_cmd("<Left>"):with_noremap(),
    ["i|<C-a>"] = map_cmd("<ESC>^i"):with_noremap(),
    ["i|<C-s>"] = map_cmd("<Esc>:w<CR>"),
    ["i|<C-q>"] = map_cmd("<Esc>:wq<CR>"),
    -- command line
    -- ["c|<C-b>"] = map_cmd("<Left>"):with_noremap(),
    -- ["c|<C-f>"] = map_cmd("<Right>"):with_noremap(),
    ["c|<C-a>"] = map_cmd("<Home>"):with_noremap(),
    ["c|<C-e>"] = map_cmd("<End>"):with_noremap(),
    ["c|<C-d>"] = map_cmd("<Del>"):with_noremap(),
    ["c|<C-h>"] = map_cmd("<BS>"):with_noremap(),
    ["c|<C-t>"] = map_cmd([[<C-R>=expand("%:p:h") . "/" <CR>]]):with_noremap(),
    ["c|w!!"] = map_cmd(
        "execute 'silent! write !sudo tee % >/dev/null' <bar> edit!"),
    -- Visual
    -- ["v|J"] = map_cmd(":m '>+1<cr>gv=gv"),
    -- ["v|K"] = map_cmd(":m '<-2<cr>gv=gv"),
    -- ["v|<"] = map_cmd("<gv"),
    -- ["v|>"] = map_cmd(">gv")
}

bind.nvim_load_mapping(def_map)
