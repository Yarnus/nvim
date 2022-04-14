-- vim.api.nvim_command('set foldmethod=expr')
-- vim.api.nvim_command('set foldexpr=nvim_treesitter#foldexpr()')
require 'nvim-treesitter.configs'.setup {
  -- ensure_installed = 'all',
  ensure_installed = { "bash", "c", "cmake", "cpp", "lua", "rust", "elixir", "python", "javascript", "typescript", "eex", "json", "make", "vim" },
  highlight = {
    enable = true
  }
}
