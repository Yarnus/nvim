local cmp = require 'cmp'
local vim = vim

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match('%s') == nil
end

local feedkey = function(key, mode)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end

cmp.setup({
  snippet = {
    expand = function(args)
      -- For `vsnip` user.
      vim.fn['vsnip#anonymous'](args.body)
    end,
  },
  formatting = {
    format = function(entry, vim_item)
      local lspkind_icons = {
        Text = "",
        Method = "",
        Function = "",
        Constructor = "",
        Field = "",
        Variable = "",
        Class = "ﴯ",
        Interface = "",
        Module = "",
        Property = "ﰠ",
        Unit = "",
        Value = "",
        Enum = "",
        Keyword = "",
        Snippet = "",
        Color = "",
        File = "",
        Reference = "",
        Folder = "",
        EnumMember = "",
        Constant = "",
        Struct = "",
        Event = "",
        Operator = "",
        TypeParameter = ""
      }
      vim_item.kind = string.format("%s %s",
        lspkind_icons[vim_item.kind],
        vim_item.kind)

      vim_item.menu = ({
        luasnip = "[SNIP]",
        buffer = "[BUF]",
        nvim_lsp = "[LSP]",
        nvim_lua = "[LUA]",
        path = "[PATH]",
      })[entry.source.name]

      return vim_item
    end
  },
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif vim.fn['vsnip#available']() == 1 then
        feedkey('<Plug>(vsnip-expand-or-jump)', '')
      elseif has_words_before() then
        cmp.complete()
      else
        -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
        fallback()
      end
    end, { 'i', 's' }),

    ['<S-Tab>'] = cmp.mapping(function()
      if cmp.visible() then
        cmp.select_prev_item()
      elseif vim.fn['vsnip#jumpable'](-1) == 1 then
        feedkey('<Plug>(vsnip-jump-prev)', '')
      end
    end, { 'i', 's' }),
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'vsnip' },
    { name = 'path' },
    { name = 'nvim_lsp_signature_help' },
    {
      name = 'buffer',
      keyword_length = 3,
      option = {
        get_bufnrs = function()
          return vim.tbl_filter(function(b) return vim.bo[b].buflisted end, vim.api.nvim_list_bufs())
        end
      }
    }

  },
  experimental = {
    -- ghost_test means the gray-text after input
    ghost_text = false
  }
})

-- vim.cmd([[highlight! CmpItemAbbrDeprecated guibg=NONE gui=strikethrough guifg=#808080]])
-- vim.cmd([[highlight! CmpItemAbbrMatch guibg=NONE guifg=#7cafc2]])
-- vim.cmd([[highlight! CmpItemAbbrMatchFuzzy guibg=NONE guifg=#7cafc2]])
-- vim.cmd([[highlight! CmpItemKindVariable guibg=NONE guifg=#dc9656]])
-- vim.cmd([[highlight! CmpItemKindInterface guibg=NONE guifg=#fb4934]])
-- vim.cmd([[highlight! CmpItemKindText guibg=NONE guifg=#9CDCFE]])
-- vim.cmd([[highlight! CmpItemKindFunction guibg=NONE guifg=#fabd2f]])
-- vim.cmd([[highlight! CmpItemKindMethod guibg=NONE guifg=#fabd2f]])
-- vim.cmd([[highlight! CmpItemKindKeyword guibg=NONE guifg=#D4D4D4]])
-- vim.cmd([[highlight! CmpItemKindProperty guibg=NONE guifg=#D4D4D4]])
-- vim.cmd([[highlight! CmpItemKindUnit guibg=NONE guifg=#D4D4D4]])
-- vim.cmd([[highlight! CmpItemKindSnippet guibg=NONE guifg=#08cd7d]])
