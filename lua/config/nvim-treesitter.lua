require 'nvim-treesitter.configs'.setup {
  ensure_installed = { "c", "c_sharp", "elixir", "yaml", "dockerfile", "html", "vue", "javascript", "json", "python",
    "json5", "typescript", "lua", "vim", "vimdoc" },
  ignore_install = {},
  auto_install = true,
  highlight = {
    enable = true,
    disable = function(lang, buf)
      if lang == "markdown" then
        return true
      end
      local max_filesize = 100 * 1024 -- 100 KB
      local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
      if ok and stats and stats.size > max_filesize then
        return true
      end
    end,
  },
  disable = {},
  -- 添加 playground 配置
  playground = {
    enable = true,
    disable = {},
    updatetime = 25,         -- Debounced time for highlighting nodes in the playground from source code
    persist_queries = false, -- Whether the query persists across vim sessions
    keybindings = {
      toggle_query_editor = 'o',
      toggle_hl_groups = 'i',
      toggle_injected_languages = 't',
      toggle_anonymous_nodes = 'a',
      toggle_language_display = 'I',
      focus_language = 'f',
      unfocus_language = 'F',
      update = 'R',
      goto_node = '<cr>',
      show_help = '?',
    },
  }
}
