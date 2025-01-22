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
  { 'rafamadriz/friendly-snippets', event = 'InsertEnter' },

  {
    'hrsh7th/nvim-cmp',
    after = 'friendly-snippets',
    config = function() require('config.nvim-cmp') end,
    dependencies = {
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-vsnip',
      'hrsh7th/vim-vsnip',
      'hrsh7th/cmp-nvim-lsp-signature-help',
      'onsails/lspkind-nvim',
    }
  },
  {
    'windwp/nvim-autopairs',
    config = function() require('config.nvim-autopairs') end,
    after = 'nvim-cmp'
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
  { 'brooth/far.vim',              cmd = { 'Far', 'Farr' } },

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

  -- markdown
  {
    'SCJangra/table-nvim',
    ft = 'markdown',
    opts = {
      padd_column_separators = true,       -- Insert a space around column separators.
      mappings = {                         -- next and prev work in Normal and Insert mode. All other mappings work in Normal mode.
        insert_column_left = '<leader>r',  -- Insert a column to the left of current column.
        insert_column_right = '<leader>l', -- Insert a column to the right of current column.
        insert_table = '<leader>t',        -- Insert a new table.
        delete_column = '<leader>d',       -- Delete the column under cursor.
      }
    },
  },

  -- align
  { 'junegunn/vim-easy-align', cmd = 'EasyAlign' },

  -- 添加 PaperColor 主题
  {
    'NLKNguyen/papercolor-theme',
    lazy = false,
    priority = 1000,
    config = function() require('themes.papercolor') end,
  }
}
