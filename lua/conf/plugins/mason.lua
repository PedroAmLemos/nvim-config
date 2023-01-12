local M = {
  "williamboman/mason.nvim",
}

function M.config()
  local mason = require "mason"
  mason.setup()
  require("mason-lspconfig").setup {
    ensure_installed = {"sumneko_lua", "rust_analyzer", "clangd", "pyright", "tsserver"},
  }
  require("mason-null-ls").setup {
    ensure_installed = {"stylua", "flake8", "black"},
  }
end

return M
