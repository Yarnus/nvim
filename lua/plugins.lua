return {
  { "nvim-lua/plenary.nvim", lazy = true },

  {
    'neovim/nvim-lspconfig',
    event = { "BufReadPre", "BufNewFile" },
    config = function() require('config.lsp') end
  },

  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    event = { "BufReadPost", "BufNewFile" },
    config = function() require('config.nvim-treesitter') end
  },

  -- completion
  {
    'rafamadriz/friendly-snippets',
    event = 'InsertEnter',
    enabled = true
  },

  {
    'hrsh7th/nvim-cmp',
    event = { "InsertEnter", "CmdlineEnter" },
    config = function() require('config.nvim-cmp') end,
    dependencies = {
      { 'hrsh7th/cmp-path',                    lazy = true },
      { 'hrsh7th/cmp-nvim-lsp',                lazy = true },
      { 'hrsh7th/cmp-buffer',                  lazy = true },
      { 'hrsh7th/cmp-vsnip',                   lazy = true },
      { 'hrsh7th/vim-vsnip',                   lazy = true },
      { 'hrsh7th/cmp-nvim-lsp-signature-help', lazy = true },
      { 'onsails/lspkind-nvim',                lazy = true },
    }
  },

  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = function() require('config.nvim-autopairs') end
  },

  {
    "nvim-tree/nvim-web-devicons",
    lazy = true
  },

  {
    "glepnir/lspsaga.nvim",
    event = "LspAttach",
    config = function() require('config.lspsaga') end
  },

  {
    'nvim-lualine/lualine.nvim',
    event = "VeryLazy",
    dependencies = { 'nvim-web-devicons' },
    config = function() require('config.lualine') end
  },

  {
    "nvim-tree/nvim-tree.lua",
    cmd = { "NvimTreeToggle", "NvimTreeFocus" },
    dependencies = { 'nvim-web-devicons' },
    config = function() require("config.nvim-tree") end
  },

  {
    'akinsho/nvim-bufferline.lua',
    event = "VeryLazy",
    config = function() require('config.nvim-bufferline') end,
  },

  {
    'lewis6991/gitsigns.nvim',
    event = { "BufReadPre", "BufNewFile" },
    config = function() require('config.gitsigns') end
  },

  {
    'numToStr/Comment.nvim',
    keys = { "gc", "gb" },
    config = function() require('Comment').setup() end
  },

  {
    "folke/todo-comments.nvim",
    event = "BufReadPost",
    config = function() require("config.todo-comments") end
  },

  {
    'brooth/far.vim',
    cmd = { 'Far', 'Farr' },
    lazy = true
  },

  {
    'norcalli/nvim-colorizer.lua',
    cmd = 'ColorizerToggle',
    config = function() require('colorizer').setup() end,
  },

  {
    'nvim-telescope/telescope.nvim',
    cmd = "Telescope",
    dependencies = {
      { 'nvim-lua/popup.nvim',                      lazy = true },
      { 'nvim-lua/plenary.nvim',                    lazy = true },
      { 'nvim-telescope/telescope-fzy-native.nvim', lazy = true },
    },
    config = function() require('config.telescope') end,
  },

  {
    'SCJangra/table-nvim',
    ft = 'markdown',
    opts = {
      padd_column_separators = true,
      mappings = {
        insert_column_left = '<leader>r',
        insert_column_right = '<leader>l',
        insert_table = '<leader>t',
        delete_column = '<leader>d',
      }
    },
  },

  {
    'junegunn/vim-easy-align',
    cmd = 'EasyAlign',
    lazy = true
  },

  {
    'NLKNguyen/papercolor-theme',
    lazy = false,
    priority = 1000,
    config = function() require('themes.papercolor') end,
  }
}
