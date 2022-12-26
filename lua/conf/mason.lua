local handlers = require "conf.lsp.handlers"
local lspconfig = require "lspconfig"

require("mason").setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗"
    }
  }
})

require('mason-lspconfig').setup{
  ensure_installed = {"sumneko_lua", "rust_analyzer", "clangd", "pyright", "tsserver", "angularls"},
}

handlers.setup()

lspconfig["sumneko_lua"].setup {
  on_attach = handlers.on_attach,
  capabilities = handlers.capabilities,
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        library = {
          [vim.fn.expand "$VIMRUNTIME/lua"] = true,
          [vim.fn.stdpath "config" .. "/lua"] = true,
        },
      },
    },
  },
}

lspconfig["clangd"].setup ({
  on_attach = handlers.on_attach,
  capabilities = handlers.capabilities,
})

lspconfig["pyright"].setup ({
  on_attach = handlers.on_attach,
  capabilities = handlers.capabilities,
  root_dir = lspconfig.util.root_pattern(".git", "src/", ".proj"),
  single_file_support = false
})

lspconfig["tsserver"].setup ({
  on_attach = handlers.on_attach,
  capabilities = handlers.capabilities,
})

local cmd = { "./node_modules/.bin/ngserver", "--stdio", "--tsProbeLocations", "./node_modules", "--ngProbeLocations",
  "./node_modules" }
lspconfig["angularls"].setup({
  on_attach = handlers.on_attach,
  capabilities = handlers.capabilities,
  cmd = cmd,
  on_new_config = function(new_config, _)
    new_config.cmd = cmd
  end,
})
