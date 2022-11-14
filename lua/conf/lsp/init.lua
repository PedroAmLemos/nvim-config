local status_ok, _ = pcall(require, "lspconfig")

if not status_ok then
  return
end

require("conf.lsp.handlers").setup()
-- require "user.lsp.null-ls"
require "conf.lsp.settings.sumneko_lua"
require "conf.lsp.settings.clangd"
require "conf.lsp.settings.pyright"
require "conf.lsp.settings.angularls"
require "conf.lsp.settings.tsserver"
