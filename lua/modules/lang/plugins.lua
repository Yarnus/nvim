local lang = {}
local conf = require("modules.lang.config")
lang["rust-lang/rust.vim"] = {opt = true, ft = "rust"}

lang["simrat39/rust-tools.nvim"] = {
    opt = true,
    ft = "rust",
    config = conf.rust_tools,
    requires = {{"nvim-lua/plenary.nvim", opt = false}}
}


lang["chrisbra/csv.vim"] = {opt = true, ft = "csv"}

return lang
