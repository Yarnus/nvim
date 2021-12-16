local ui = {}
local conf = require("modules.ui.config")

ui["kyazdani42/nvim-web-devicons"] = {opt = false}

ui["glepnir/galaxyline.nvim"] = {
  opt = false,
  branch = "main",
  requires = {"kyazdani42/nvim-web-devicons"},
  config = conf.galaxyline
}

ui["kyazdani42/nvim-tree.lua"] = {
    opt = true,
    cmd = {"NvimTreeToggle", "NvimTreeOpen"},
    config = conf.nvim_tree
}
ui["lewis6991/gitsigns.nvim"] = {
    opt = true,
    event = {"BufRead", "BufNewFile"},
    config = conf.gitsigns,
    requires = {"nvim-lua/plenary.nvim", opt = true}
}

ui["akinsho/nvim-bufferline.lua"] = {
    opt = true,
    event = "BufRead",
    config = conf.nvim_bufferline
}

ui["Avimitin/neovim-deus"] = {config = conf.deus}

return ui
