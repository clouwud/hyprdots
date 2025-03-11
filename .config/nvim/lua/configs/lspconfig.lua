-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

-- EXAMPLE
local servers = {
  "bashls",
  "html",
  "cssls",
  "cmake",
  "ts_ls",
  "clangd",
  "jsonls",
  "pyright",
  "tailwindcss",
  "prismals",
  "rust_analyzer",
  "gopls",
}
local nvlsp = require "nvchad.configs.lspconfig"

local on_attach = nvlsp.on_attach
local capabilities = nvlsp.capabilities
-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

lspconfig["clangd"].setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "c", "cc", "cpp", "h", "hpp", "cxx" },
  cmd = {
    "clangd",
    "--offset-encoding=utf-16",
  },
}

lspconfig["pyright"].setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

lspconfig.gopls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "gopls" },
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  settings = {
    gopls = {
      completeUnimported = true,
      usePlaceholders = true,
      staticcheck = true,
      analyses = {
        unusedparams = true,
      },
    },
  },
}
-- configuring single server, example: typescript
-- lspconfig.ts_ls.setup {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- }
