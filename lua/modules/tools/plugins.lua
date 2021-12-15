local tools = {}
local conf = require("modules.tools.config")

tools["nvim-lua/plenary.nvim"] = {opt = false}

tools["nvim-telescope/telescope.nvim"] = {
    config = conf.telescope,
    requires = {
        {"nvim-lua/plenary.nvim", opt = false},
        {"nvim-lua/popup.nvim", opt = true}
    }
}
tools["nvim-telescope/telescope-fzf-native.nvim"] = {
    opt = true,
    run = "make",
    after = "telescope.nvim"
}
tools["nvim-telescope/telescope-project.nvim"] = {
    opt = true,
    after = "telescope.nvim"
}
tools["nvim-telescope/telescope-frecency.nvim"] = {
    opt = true,
    after = "telescope.nvim",
    requires = {{"tami5/sqlite.lua", opt = true}}
}
tools["nvim-telescope/telescope-media-files.nvim"] = {
    opt = true,
    after = "telescope.nvim"
}

tools["dstein64/vim-startuptime"] = {opt = true, cmd = "StartupTime"}
tools["famiu/bufdelete.nvim"] = {opt = true, cmd = {"Bdelete", "Bwipeout"}}
tools["nathom/filetype.nvim"] = {}


return tools
