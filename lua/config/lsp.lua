local fn = vim.fn
local api = vim.api
-- local keymap = vim.keymaplsp
local lsp = vim.lsp
local diagnostic = vim.diagnostic
local utils = require("utils")

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
vim.cmd('autocmd BufWritePre * lua vim.lsp.buf.format()')

-- Change diagnostic signs.
fn.sign_define("DiagnosticSignError", { text = '', texthl = "DiagnosticSignError" })
fn.sign_define("DiagnosticSignWarn", { text = '', texthl = "DiagnosticSignWarn" })
fn.sign_define("DiagnosticSignInfo", { text = '', texthl = "DiagnosticSignInfo" })
fn.sign_define("DiagnosticSignHint", { text = '', texthl = "DiagnosticSignHint" })

-- global config for diagnostic
diagnostic.config({
  underline = true,
  virtual_text = false,
  update_in_insert = false,
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
    -- active = signs,
  },
})

-- Change border of documentation hover window, See https://github.com/neovim/neovim/pull/13998.
lsp.handlers["textDocument/publishDiagnostics"] = lsp.with(
  lsp.diagnostic.on_publish_diagnostics, { underline = true, update_in_insert = false }
)
lsp.handlers["textDocument/hover"] = lsp.with(lsp.handlers.hover, { border = "rounded" })
lsp.handlers["textDocument/signatureHelp"] = lsp.with(lsp.handlers.signature_help, { border = "single" })

local on_attach = function(client, bufnr)
  local function buf_set_keymap(...)
    vim.api.nvim_buf_set_keymap(bufnr, ...)
  end

  local function buf_set_option(...)
    vim.api.nvim_buf_set_option(bufnr, ...)
  end

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap = true, silent = true }
  -- hover doc
  -- NOTE: will define on top of lspsaga.lua
  buf_set_keymap('n', 'K', '<cmd>Lspsaga hover_doc<CR>', opts)
  -- Diagnsotic jump can use `<c-o>` to jump back
  buf_set_keymap('n', 'gl', '<cmd>Lspsaga show_line_diagnostics<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>Lspsaga goto_definition<CR>', opts)
  buf_set_keymap('n', 'gD', '<cmd>Lspsaga peek_definition<CR>', opts)
  buf_set_keymap('n', '<leader>rn', '<cmd>Lspsaga rename<CR>', opts)
  buf_set_keymap('n', '<leader>ca', '<cmd>Lspsaga code_action<CR>', opts)
  buf_set_keymap('v', '<leader>ca', '<cmd><C-U>Lspsaga range_code_action<CR>', opts)
  -- use <C-t> to jump back
  -- buf_set_keymap("n", "<leader>ff", "<cmd>Lspsaga lsp_finder<CR>", opts)

  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  -- buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)

  -- replace on top of lspsaga
  -- buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  -- buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  -- buf_set_keymap('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
  -- buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  -- buf_set_keymap('n', 'ga', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)

  -- I hardly ever use them
  -- buf_set_keymap('n', '<leader>wl','<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>',opts)
  -- buf_set_keymap('n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  -- buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  -- buf_set_keymap('n', '<leader>wa','<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  -- buf_set_keymap('n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
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

-- local capabilities = require('cmp_nvim_lsp').default_capabilities()
-- NOTE: manual install ref to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
local lspconfig = require("lspconfig")

if utils.executable("lua-language-server") then
  lspconfig.lua_ls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
      Lua = {
        runtime = { version = 'LuaJIT' },
        diagnostics = { globals = { 'vim' } },
        telemetry = { enable = false },
      },
    },
  }
else
  vim.notify('lua-language-server not found!', vim.log.levels.WARN, { title = 'Nvim-config' })
end


lspconfig.elixirls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  -- cmd = { '/Users/yarnus/.config/elixir_ls/_build/v0.20.0/language_server.sh' },
  cmd = { '/Users/yarnus/.config/elixir_ls/v0201_old_relase/language_server.sh' },
  -- cmd = { '/Users/yarnus/.config/elixir_ls/_build/v0.20.1_mixinstall/language_server.sh' },
  filetypes = { 'elixir', 'eelixir' },
  -- root_dir = lspconfig.util.root_pattern('deps/', '.git') or vim.loop.os_homedir(),
  settings = {
    elixirLS = {
      dialyzerEnabled = false,
      fetchDeps = false,
      suggestSpecs = false,
      autoInsertRequiredAlias = true,
      autoBuild = false
    }
  }
}


lspconfig.pyright.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { 'python' },
  settings = {
    pyright = {
      disableLanguageServices = false,
      disableOrganizeImports = false
    },
    python = {
      analysis = {
        autoImportCompletions = true,
        autoSearchPaths = true,
        diagnosticMode = 'workspace',
        useLibraryCodeForTypes = true
      }
    }
  }
}

lspconfig.jsonls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "json", "jsonc" },
  init_options = { provideFormatter = true }
}
