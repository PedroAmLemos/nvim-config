local handlers = require "conf.lsp.handlers"
local lspconfig = require("lspconfig")


lspconfig["tsserver"].setup ({
  on_attach = handlers.on_attach,
  capabilities = handlers.capabilities,
})
