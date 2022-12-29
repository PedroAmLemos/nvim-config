local M = {
  "L3MON4D3/LuaSnip",
  dependencies = {
    "rafamadriz/friendly-snippets",
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load()
    end,
  },
}

function M.config()
  local ls = require "luasnip"
  ls.config.set_config {
    history = true,
    updateevents = "TextChanged, TextChangedI",
    enable_autosnippets = true,
  }

  vim.keymap.set({ "i", "s" }, "<c-j>", function()
    if ls.expand_or_jumpable() then
      ls.expand_or_jump()
    end
  end, { noremap = true, silent = true })

  vim.keymap.set({ "i", "s" }, "<c-k>", function()
    if ls.jumpable(-1) then
      ls.jump(-1)
    end
  end, { noremap = true, silent = true })
end

return M
