local M = {
  "folke/tokyonight.nvim",
  lazy = false,
}

function M.config()
  -- vim.o.background = "dark"
  local tokyonight = require("tokyonight")
  tokyonight.setup({
    style = "moon",
    -- transparent = true,
    -- hide_inactive_statusline = false,
    sidebars = {
      "qf",
      "vista_kind",
      "terminal",
      -- "packer",
      "spectre_panel",
      "NeogitStatus",
      -- "help",
      "startuptime",
      "Outline",
    },
    transparent = false,
    styles = {},
    on_colors = function(c) end,
  })

  tokyonight.load()
end

return M
