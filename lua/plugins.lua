return {

  { "nvim-lua/plenary.nvim" },

  {
    'neovim/nvim-lspconfig',
    event = { "BufRead", "BufNewFile" },
    config = function() require('config.lsp') end
  },
  -- treesitter
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    event = 'VeryLazy',
    config = function() require('config.nvim-treesitter') end
  },

  -- completion
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      'hrsh7th/vim-vsnip',
      "hrsh7th/cmp-nvim-lsp",
      "onsails/lspkind-nvim",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-omni",
    },
    config = function() require('config.nvim-cmp') end,
  },

  -- old
  { "nvim-tree/nvim-web-devicons", event = "VeryLazy" },

  {
    "glepnir/lspsaga.nvim",
    branch = "main",
    config = function() require('config.lspsaga') end
  },
  {
    'nvim-lualine/lualine.nvim',
    branch = 'master',
    event = 'VeryLazy',
    dependencies = { 'nvim-web-devicons' },
    config = function() require('config.lualine') end
  },
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function() require("config.nvim-tree") end
  },
  {
    'akinsho/nvim-bufferline.lua',
    branch = 'main',
    event = { 'BufEnter' },
    config = function() require('config.nvim-bufferline') end,
  },
  { 'Yarnus/friendly-snippets', event = 'InsertEnter' },

  {
    'windwp/nvim-autopairs',
    config = function() require('config.nvim-autopairs') end,
    after = 'nvim-cmp'
  },

  -- git stuff
  {
    'lewis6991/gitsigns.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    event = 'BufRead',
    config = function() require('config.gitsigns') end
  },
  {
    'numToStr/Comment.nvim',
    event = 'BufRead',
    config = function() require('Comment').setup() end
  },
  {
    "folke/todo-comments.nvim",
    dependencies = "nvim-lua/plenary.nvim",
    config = function() require("config.todo-comments") end
  },

  -- Find and replace
  { 'brooth/far.vim',           cmd = { 'Far', 'Farr' } },

  -- show color
  {
    'norcalli/nvim-colorizer.lua',
    config = function() require('colorizer').setup() end,
    cmd = 'ColorizerToggle',
  },

  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      'nvim-lua/popup.nvim',
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope-fzy-native.nvim',
    },
    config = function() require('config.telescope') end,
  },

  -- align
  { 'junegunn/vim-easy-align', cmd = 'EasyAlign' },
  -- { 'luisiacc/gruvbox-baby',   priority = 1000,  config = function() require('themes.gruvbox-baby') end },

  {
    "neanias/everforest-nvim",
    version = false,
    lazy = false,
    priority = 1000,
    config = function() require('themes.everforest') end,
  },
  -- { 'glepnir/zephyr-nvim', config = function() require('themes.zephyr') end }
  { 'wakatime/vim-wakatime' },
}
