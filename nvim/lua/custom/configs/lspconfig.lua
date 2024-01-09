local config = require("plugins.configs.lspconfig")

local on_attach =config.on_attach
local capabilities = config.capabilities

local lspconfig = require("lspconfig")

lspconfig.rust_analyzer.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes ={"rust"},
  root_dir = lspconfig.util.root_pattern("Cargo.toml"),
})
lspconfig.pyright.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes ={"python"},
})
lspconfig.texlab.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes ={"tex"},
})
