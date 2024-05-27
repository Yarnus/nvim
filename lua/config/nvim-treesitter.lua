require 'nvim-treesitter.configs'.setup {
  ensure_installed = 'all',
  ignore_install = { 'markdown', 'markdown_inline' },
  highlight = { enable = true },
  disable = { 'markdown', 'markdown_inline' }
}
