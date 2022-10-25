require('packer').init {
  display = {
    open_fn = function() return require('packer.util').float { border = 'single' } end
  },
  git = { clone_timeout = 60 }
}

return require('packer').startup(function(use)
  use { 'wbthomason/packer.nvim', event = 'VimEnter' }
  use { 'kyazdani42/nvim-web-devicons' }

  use({
    "glepnir/lspsaga.nvim",
    branch = "main",
    config = function() require('config.lspsaga') end
  })

  use {
    'glepnir/galaxyline.nvim',
    branch = 'main',
    after = 'nvim-web-devicons',
    config = function() require('config.eviline') end
  }

  use {
    "kyazdani42/nvim-tree.lua",
    requires = { 'kyazdani42/nvim-web-devicons' },
    config = function() require("config.nvim-tree") end
  }

  use {
    'akinsho/nvim-bufferline.lua',
    branch = 'main',
    config = function() require('config.nvim-bufferline') end,
    -- event = 'BufRead'
  }

  -- nvim-cmp and sources.
  use { 'Yarnus/friendly-snippets', event = 'InsertEnter' }
  use {
    'hrsh7th/nvim-cmp',
    after = 'friendly-snippets',
    config = function() require('config.nvim-cmp') end,
    requires = { 'onsails/lspkind-nvim' }
  }
  use { 'hrsh7th/cmp-path', after = { 'nvim-cmp' } }
  use { 'hrsh7th/cmp-nvim-lsp', after = { 'nvim-cmp' } }
  use { 'hrsh7th/cmp-buffer', after = { 'nvim-cmp' } }
  use { 'hrsh7th/cmp-vsnip', after = { 'nvim-cmp' } }
  use { 'hrsh7th/vim-vsnip', after = { 'nvim-cmp' } }
  use { 'hrsh7th/cmp-nvim-lsp-signature-help', after = { 'nvim-cmp' } }
  use {
    'windwp/nvim-autopairs',
    config = function() require('config.nvim-autopairs') end,
    after = 'nvim-cmp'
  }

  -- lsp
  use { 'williamboman/nvim-lsp-installer' }

  use {
    'neovim/nvim-lspconfig',
    config = function() require('config.nvim-lspconfig') end,
    after = 'nvim-lsp-installer'
  }

  -- treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    event = 'BufRead',
    config = function() require('config.nvim-treesitter') end
  }

  -- git stuff
  use {
    'lewis6991/gitsigns.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    event = 'BufRead',
    config = function() require('config.gitsigns') end
  }

  use {
    'numToStr/Comment.nvim',
    event = 'BufRead',
    config = function() require('Comment').setup() end
  }

  use {
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = function() require("config.todo-comments") end
  }

  -- Find and replace
  use { 'brooth/far.vim', cmd = { 'Far', 'Farr' } }

  -- show color
  use {
    'norcalli/nvim-colorizer.lua',
    config = function() require('colorizer').setup() end,
    cmd = 'ColorizerToggle',
  }

  -- telescope
  use {
    'nvim-telescope/telescope.nvim',
    requires = { 'nvim-lua/popup.nvim', 'nvim-lua/plenary.nvim', 'nvim-telescope/telescope-fzy-native.nvim',
      'stevearc/aerial.nvim' },
    config = function() require('config.telescope') end,
    -- cmd = 'Telescope'
  }

  -- flag
  use { 'stevearc/aerial.nvim', config = function() require('config.aerial') end }

  -- align
  use { 'junegunn/vim-easy-align', cmd = 'EasyAlign' }
  -- use { 'luisiacc/gruvbox-baby', config = function() require('themes.gruvbox-baby') end }
  use { 'glepnir/zephyr-nvim', config = function() require('themes.zephyr') end }

end)
