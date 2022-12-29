local M = {
  "williamboman/mason.nvim",
}

function M.config()
  local mason = require "mason"
  mason.setup()
  require("mason-lspconfig").setup {
    automatic_installation = {exlude = {"jdtls"}},
  }
  require("mason-null-ls").setup {
    ensure_installed = {"stylua", "flake8", "black"},
  }
end

return M
