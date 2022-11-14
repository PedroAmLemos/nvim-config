local handlers = require("conf.lsp.handlers")
local lspconfig = require("lspconfig")


lspconfig["pyright"].setup ({
  on_attach = handlers.on_attach,
  capabilities = handlers.capabilities,
  root_dir = lspconfig.util.root_pattern(".git", "src/", ".proj"),
  single_file_support = false
})
