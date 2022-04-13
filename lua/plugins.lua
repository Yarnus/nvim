require('packer').init {
  display = {
    open_fn = function() return require('packer.util').float { border = 'single' } end
  },
  git = { clone_timeout = 60 } }

-- local map = require('utils').map

return require('packer').startup(function(use)
  use { 'wbthomason/packer.nvim', event = 'VimEnter' }

  use { 'kyazdani42/nvim-web-devicons' }

  use {
    'NTBBloodbath/galaxyline.nvim',
    branch = 'main',
    after = 'nvim-web-devicons',
    config = function() require('config.galaxyline') end
  }

  use {
    'kyazdani42/nvim-tree.lua',
    config = function() require('config.nvim-tree') end,
    cmd = { 'NvimTreeRefresh', 'NvimTreeToggle' }
  }

  use {
    'projekt0n/circles.nvim',
    config = function() require('config.circles') end,
    after = 'nvim-web-devicons',
    requires = { { 'kyazdani42/nvim-tree.lua', opt = true } }
  }

  use {
    'akinsho/nvim-bufferline.lua',
    branch = 'main',
    config = function() require('config.nvim-bufferline') end,
    event = 'BufRead'
  }

  use { 'rafamadriz/friendly-snippets', event = 'InsertEnter' }

  -- nvim-cmp
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
  use {
    'windwp/nvim-autopairs',
    config = function() require('config.nvim-autopairs') end,
    after = 'nvim-cmp'
  }

  -- lsp
  use {
    'williamboman/nvim-lsp-installer',
    ft = { 'bash', 'sh', 'c', 'cpp', 'html', 'json', 'python', 'elixir', 'js', 'javascrip', 'lua' }
  }

  use {
    'neovim/nvim-lspconfig',
    config = function() require('config.nvim-lspconfig') end,
    after = 'nvim-lsp-installer'
  }

  use {
    'ray-x/lsp_signature.nvim',
    config = function() require('config.lsp-signature') end,
    after = 'nvim-lspconfig'
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
    'terrortylor/nvim-comment',
    event = 'BufRead',
    config = function() require('nvim_comment').setup() end
  }

  -- Find and replace
  use { 'brooth/far.vim', cmd = { 'Far', 'Farr' } }

  -- quick reload
  use {
    'famiu/nvim-reload',
    cmd = { 'Reload', 'Restart' },
    requires = 'nvim-lua/plenary.nvim'
  }

  -- show color
  use {
    'norcalli/nvim-colorizer.lua',
    cmd = 'ColorizerToggle',
    config = function() require('colorizer').setup() end
  }

  -- telescope
  use {
    'nvim-telescope/telescope.nvim',
    requires = { 'nvim-lua/popup.nvim', 'nvim-lua/plenary.nvim', 'nvim-telescope/telescope-fzy-native.nvim' },
    config = function() require('config.telescope') end,
    module = 'telescope'
  }

  -- align
  use { 'junegunn/vim-easy-align', cmd = 'EasyAlign' }

  -- speed up neovim!
  use { 'nathom/filetype.nvim' }

  use {
    'sainnhe/gruvbox-material',
    after = 'packer.nvim',
    config = function() require('themes.gruvbox-material') end
  }
end)
