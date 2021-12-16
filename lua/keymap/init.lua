local bind = require("keymap.bind")
local map_cr = bind.map_cr
local map_cu = bind.map_cu
local map_cmd = bind.map_cmd
require("keymap.config")

local plug_map = {
    -- Bufferline
    ["n|gb"] = map_cr("BufferLinePick"):with_noremap():with_silent(),
    ["n|<A-j>"] = map_cr("BufferLineCycleNext"):with_noremap():with_silent(),
    ["n|<A-k>"] = map_cr("BufferLineCyclePrev"):with_noremap():with_silent(),
    ["n|<A-S-j>"] = map_cr("BufferLineMoveNext"):with_noremap():with_silent(),
    ["n|<A-S-k>"] = map_cr("BufferLineMovePrev"):with_noremap():with_silent(),
    ["n|<leader>be"] = map_cr("BufferLineSortByExtension"):with_noremap(),
    ["n|<leader>bd"] = map_cr("BufferLineSortByDirectory"):with_noremap(),
    -- Lsp mapp work when insertenter and lsp start
    ["n|<leader>li"] = map_cr("LspInfo"):with_noremap():with_silent():with_nowait(),
    ["n|<leader>lr"] = map_cr("LspRestart"):with_noremap():with_silent():with_nowait(),
    ["n|g["] = map_cr("Lspsaga diagnostic_jump_next"):with_noremap():with_silent(),
    ["n|g]"] = map_cr("Lspsaga diagnostic_jump_prev"):with_noremap():with_silent(),
    ["n|K"] = map_cr("Lspsaga hover_doc"):with_noremap():with_silent(),
    ["n|<C-Up>"] = map_cr("lua require('lspsaga.action').smart_scroll_with_saga(-1)"):with_noremap():with_silent(),
    ["n|<C-Down>"] = map_cr("lua require('lspsaga.action').smart_scroll_with_saga(1)"):with_noremap():with_silent(),
    ["n|gd"] = map_cr("Lspsaga preview_definition"):with_noremap():with_silent(),
    ["n|gD"] = map_cr("lua vim.lsp.buf.definition()"):with_noremap():with_silent(),
    ["n|gs"] = map_cr("Lspsaga signature_help"):with_noremap():with_silent(),
    ["n|gr"] = map_cr("Lspsaga rename"):with_noremap():with_silent(),
    ["n|gh"] = map_cr("lua vim.lsp.buf.references()"):with_noremap():with_silent(),
    -- Plugin nvim-tree
    ["n|<C-n>"] = map_cr("NvimTreeToggle"):with_noremap():with_silent(),
    -- Plugin Telescope
    ["n|<C-p>"] = map_cu("Telescope find_files"):with_noremap():with_silent(),
    ["n|<Leader>ff"] = map_cu("Telescope live_grep"):with_noremap():with_silent(),
    ["n|<Leader>fp"] = map_cu("Telescope project"):with_noremap():with_silent(),
    ["n|<Leader>fr"] = map_cu("Telescope frecency"):with_noremap():with_silent(),
    ["n|<Leader>fb"] = map_cu("Telescope file_browser"):with_noremap():with_silent(),
    ["n|<Leader>fg"] = map_cu("Telescope git_files"):with_noremap():with_silent(),
    -- Plugin EasyAlign
    ["n|ga"] = map_cmd("v:lua.enhance_align('nga')"):with_expr(),
    ["x|ga"] = map_cmd("v:lua.enhance_align('xga')"):with_expr(),
}

bind.nvim_load_mapping(plug_map)
