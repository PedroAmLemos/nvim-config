local handlers = require "conf.lsp.handlers"
local lspconfig = require("lspconfig")


local cmd = { "./node_modules/.bin/ngserver", "--stdio", "--tsProbeLocations", "./node_modules", "--ngProbeLocations",
  "./node_modules" }
lspconfig["angularls"].setup({
  on_attach = handlers.on_attach,
  capabilities = handlers.capabilities,
  cmd = cmd,
  on_new_config = function(new_config, new_root_dir)
    new_config.cmd = cmd
  end,
})

