local handlers = require "conf.lsp.handlers"
local lspconfig = require("lspconfig")


lspconfig["rust_analyzer"].setup ({
  on_attach = handlers.on_attach,
  capabilities = handlers.capabilities,
})
