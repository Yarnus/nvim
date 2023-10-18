return {
  { 'kyazdani42/nvim-web-devicons' },
  {
    "glepnir/lspsaga.nvim",
    branch = "main",
    config = function() require('config.lspsaga') end
  },
  {
    'nvim-lualine/lualine.nvim',
    branch = 'master',
    dependencies = { 'nvim-web-devicons' },
    config = function() require('config.lualine') end
  },
  {
    "kyazdani42/nvim-tree.lua",
    dependencies = { 'kyazdani42/nvim-web-devicons' },
    config = function() require("config.nvim-tree") end
  },
  {
    'akinsho/nvim-bufferline.lua',
    branch = 'main',
    config = function() require('config.nvim-bufferline') end,
  },
  { 'Yarnus/friendly-snippets',    event = 'InsertEnter' },
  {
    'hrsh7th/nvim-cmp',
    after = 'friendly-snippets',
    config = function() require('config.nvim-cmp') end,
    dependencies = { 'onsails/lspkind-nvim' }
  },
  { 'hrsh7th/cmp-path',                    after = { 'nvim-cmp' } },
  { 'hrsh7th/cmp-nvim-lsp',                after = { 'nvim-cmp' } },
  { 'hrsh7th/cmp-buffer',                  after = { 'nvim-cmp' } },
  { 'hrsh7th/cmp-vsnip',                   after = { 'nvim-cmp' } },
  { 'hrsh7th/vim-vsnip',                   after = { 'nvim-cmp' } },
  { 'hrsh7th/cmp-nvim-lsp-signature-help', after = { 'nvim-cmp' } },
  {
    'windwp/nvim-autopairs',
    config = function() require('config.nvim-autopairs') end,
    after = 'nvim-cmp'
  },

  -- lsp
  { 'williamboman/mason.nvim', build = ':MasonUpdate', config = function() require("mason").setup() end },
  {
    'williamboman/mason-lspconfig.nvim',
    opts = {
      ensure_installed = { 'clangd', 'html', 'jsonls', 'elixirls', 'jedi-language-server', 'rome', 'rust_analyzer',
        'lua_ls' }
    },
    config = function()
      require("mason-lspconfig").setup(opts)
      require('config.mason-lspconfig')
    end
  },

  {
    'neovim/nvim-lspconfig', dependencies = { 'williamboman/mason.nvim', 'williamboman/mason-lspconfig.nvim' }
  },

  -- treesitter
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    event = 'BufRead',
    config = function() require('config.nvim-treesitter') end
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
  { 'brooth/far.vim',          cmd = { 'Far', 'Farr' } },

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
  -- { "lukas-reineke/indent-blankline.nvim", config = function() require('config.indent_blankline') end },
  { 'wakatime/vim-wakatime' },
}
