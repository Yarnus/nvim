local mason_lspconfig = require("utils").require("mason-lspconfig")
local lspconfig = require("utils").require("lspconfig")
if not mason_lspconfig or not lspconfig then
  return
end

local vim = vim
function _G.reload_lsp()
  vim.lsp.stop_client(vim.lsp.get_active_clients())
  vim.cmd [[edit]]
end

function _G.open_lsp_log()
  local path = vim.lsp.get_log_path()
  vim.cmd('edit ' .. path)
end

vim.cmd('command! -nargs=0 LspLog call v:lua.open_lsp_log()')
vim.cmd('command! -nargs=0 LspRestart call v:lua.reload_lsp()')
vim.cmd('command! -nargs=0 DiagnosticShow lua vim.diagnostic.open_float()')
vim.cmd('command! -nargs=0 DiagnosticList lua vim.diagnostic.setloclist()')
-- NOTE: auto format once buffer save.
vim.cmd('autocmd BufWritePre * lua vim.lsp.buf.formatting_sync()')



local signs = {
  { name = "DiagnosticSignError", text = "" },
  { name = "DiagnosticSignWarn", text = "" },
  { name = "DiagnosticSignHint", text = "" },
  { name = "DiagnosticSignInfo", text = "" },
}

for _, sign in ipairs(signs) do
  vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
end

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics,
  { underline = true, update_in_insert = false }
)

vim.diagnostic.config({
  virtual_text = true,
  update_in_insert = false,
  underline = true,
  severity_sort = true,
  float = {
    focusable = false,
    style = "minimal",
    border = "single",
    source = "always",
    header = "",
    prefix = "",
  },
  signs = {
    active = signs,
  },
})

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = "single",
})

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
  border = "single",
})

local on_attach = function(client, bufnr)
  local function buf_set_keymap(...)
    vim.api.nvim_buf_set_keymap(bufnr, ...)
  end

  local function buf_set_option(...)
    vim.api.nvim_buf_set_option(bufnr, ...)
  end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap = true, silent = true }
  -- hover doc
  -- NOTE: will define on top of lspsaga.lua
  buf_set_keymap('n', 'K', '<cmd>Lspsaga hover_doc<CR>', opts)
  -- Diagnsotic jump can use `<c-o>` to jump back
  buf_set_keymap('n', 'gl', '<cmd>Lspsaga show_line_diagnostics<CR>', opts)
  -- buf_set_keymap('n', 'gd', '<cmd>Lspsaga preview_definition<CR>', opts)
  buf_set_keymap('n', '<leader>rn', '<cmd>Lspsaga rename<CR>', opts)
  buf_set_keymap('n', '<leader>ca', '<cmd>Lspsaga code_action<CR>', opts)
  buf_set_keymap('v', '<leader>ca', '<cmd><C-U>Lspsaga range_code_action<CR>', opts)
  -- use <C-t> to jump back
  -- buf_set_keymap("n", "<leader>ff", "<cmd>Lspsaga lsp_finder<CR>", opts)

  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)

  -- replace on top of lspsaga
  -- buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  -- buf_set_keymap('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
  -- buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  -- buf_set_keymap('n', 'ga', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)

  -- I hardly ever use them
  -- buf_set_keymap('n', '<leader>wl','<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>',opts)
  -- buf_set_keymap('n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  -- buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  -- buf_set_keymap('n', '<leader>wa','<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  -- buf_set_keymap('n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)

  -- -- aerial required
  -- require("aerial").on_attach(client, bufnr)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.foldingRange = {
  dynamicRegistration = false,
  lineFoldingOnly = true,
}
capabilities.textDocument.completion = {
  completionItem = {
    commitCharactersSupport = true,
    deprecatedSupport = true,
    insertReplaceSupport = true,
    insertTextModeSupport = {
      valueSet = { 1, 2 },
    },
    labelDetailsSupport = true,
    preselectSupport = true,
    resolveSupport = {
      properties = { "documentation", "detail", "additionalTextEdits" },
    },
    snippetSupport = true,
    tagSupport = {
      valueSet = { 1 },
    },
  },
  completionList = {
    itemDefaults = {
      "commitCharacters",
      "editRange",
      "insertTextFormat",
      "insertTextMode",
      "data",
    },
  },
  contextSupport = true,
  dynamicRegistration = false,
  insertTextMode = 1,
}

local opts = {
  on_attach = on_attach,
  capabilities = capabilities,
}

local custom_lua_ls = {
      settings = {
        Lua = {
            runtime = { version = "LuaJIT" },
            diagnostics = { globals = { "vim" } },
            telemetry = {enable = false  },
        },
    }
}
local lua_ls_opts = vim.tbl_extend("force", opts, custom_lua_ls)

local clangd_opts = opts
clangd_opts.capabilities.offsetEncoding = "utf-8"

mason_lspconfig.setup_handlers({
  function(server_name)
    lspconfig[server_name].setup(opts)
  end,

  ["lua_ls"] = function()
    lspconfig.lua_ls.setup(lua_ls_opts)
  end,

  ["clangd"] = function()
    lspconfig.clangd.setup(clangd_opts)
  end,

  ["rust_analyzer"] = function()
    require("rust-tools").setup({
      server = {
        on_attach = on_attach,
      },
    })
  end,
})
