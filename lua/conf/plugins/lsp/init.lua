local M = {
  "neovim/nvim-lspconfig",
  event = "BufReadPre",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    {
      "folke/neodev.nvim",
    }
  }
}

function M.config()
  local handlers = require "conf.plugins.lsp.handlers"
  local lspconfig = require "lspconfig"
  require("mason")
  handlers.setup()
  require("neodev").setup()

  local servers = {
    clangd = {},
    pyright = {
      root_dir = lspconfig.util.root_pattern(".git", "src/", ".proj"),
      single_file_support = false,
    },
    sumneko_lua = {
      settings = {
        Lua = {
          workspace = {
            checkThirdParty = false,
          },
          completion = {
            workspaceWord = true,
            callSnippet = "Both",
          },
        },
      },
    },
    tsserver = {},
    rust_analyzer = {
      settings = {
        ["rust_analyzer"] = {
          cargo = { allFeatures = true }
        }
      }

    }
  }
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
  capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true,
  }
  local options = {
    on_attach = handlers.on_attach,
    capabilities = capabilities,
    flags = {
      debounce_text_changes = 150,
    },
  }
  for server, opts in pairs(servers) do
    opts = vim.tbl_deep_extend("force", {}, options, opts or {})
    if server == "tsserver" then
      require("typescript").setup({ server = opts })
     elseif server == "rust_analyzer" then
       require("conf.plugins.rust-tools").setup(handlers.on_attach)
    else
      require("lspconfig")[server].setup(opts)
    end
  end

  require("conf.plugins.null-ls").setup(options)


end

return M
