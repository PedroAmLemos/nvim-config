local M = {
  "kyazdani42/nvim-tree.lua",
  lazy = false,
}

function M.config()
  local nvim_tree = require"nvim-tree"
  nvim_tree.setup{}

end

M.keys = {
  {"<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "Nvim-Tree"}
}


return M