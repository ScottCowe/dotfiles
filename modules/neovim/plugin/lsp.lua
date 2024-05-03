local bufmap = function(keys, func, bufnr)
  vim.keymap.set('n', keys, func, { buffer = bufnr })
end

local on_attach = function(_, bufnr)
  bufmap('<leader>r', vim.lsp.buf.rename, bufnr)
  bufmap('<leader>a', vim.lsp.buf.code_action, bufnr)

  bufmap('gd', vim.lsp.buf.definition, bufnr)
  bufmap('gD', vim.lsp.buf.declaration, bufnr)
  bufmap('gI', vim.lsp.buf.implementation, bufnr)
  bufmap('<leader>D', vim.lsp.buf.type_definition, bufnr)

  bufmap('gr', require('telescope.builtin').lsp_references, bufnr)
  bufmap('<leader>s', require('telescope.builtin').lsp_document_symbols, bufnr)
  bufmap('<leader>S', require('telescope.builtin').lsp_dynamic_workspace_symbols, bufnr)

  bufmap('K', vim.lsp.buf.hover, bufnr)

  vim.api.nvim_buf_create_user_command(bufnr, 'Format', function()
    vim.lsp.buf.format()
  end, {})
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

require('neodev').setup()

local lspconfig = require('lspconfig')

lspconfig.nixd.setup({})

lspconfig.lua_ls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    Lua = {
      workspace = {
        checkThirdParty = false,
        library = {
          vim.env.VIMRUNTIME
        }
      },
      telemetry = { enable = false },
    },
  }
})

local jdtlsCommand = "nix eval --raw nixpkgs#jdt-language-server.outPath"
local cmdHandler = io.popen(jdtlsCommand);
local jdtlsPath = cmdHandler:read("*a")
cmdHandler:close()

local jdtls = require('jdtls')

jdtls.start_or_attach({
  cmd = { jdtlsPath .. "/bin/jdtls" },
  root_dir = vim.fs.dirname(vim.fs.find({'gradlew', '.git', 'mvnw'}, { upward = true })[1]),
  on_attach = on_attach,
  contentProvider = { preferred = 'fernflower' },
  sources = {
    organizeImports = {
      starThreshold = 9999;
      staticStarThreshold = 9999;
    }
  },
})
