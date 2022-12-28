local M = {
    "williamboman/mason.nvim",
    -- lazy = false
}

function M.config()
    local mason = require("mason")
    mason.setup()
    require("mason-lspconfig").setup{
        automatic_installation = true
    }
end


return M