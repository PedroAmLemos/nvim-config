local M = {
  "windwp/nvim-ts-autotag",
  "p00f/nvim-ts-rainbow",
  "nvim-treesitter/nvim-treesitter-refactor",
  "JoosepAlviste/nvim-ts-context-commentstring",
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = "BufReadPost",
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
    },
    config = function()
      local configs = require "nvim-treesitter.configs"
      configs.setup {
        ensure_installed = "all",

        sync_install = false,
        ignore_install = { "" },
        matchup = {
          enable = true,
          disable = { "markdown" },
        },

        highlight = {
          enable = true,
          -- disable = { "haskell" },
          additional_vim_regex_highlighting = true,
        },

        indent = { enable = true, disable = { "yaml", "python", "c" } },

        autotag = {
          enable = true,
          disable = { "xml" },
        },

        autopairs = {
          enable = true,
        },

        rainbow = {
          enable = false,
          extended_mode = true, -- Highlight also non-parentheses delimiters, boolean or table: lang -> boolean
          max_file_lines = nil, -- Do not enable for files with more than 1000 lines, int
        },
        context_commentstring = {
          enable_autocmd = false,
        },
      }
    end,
  },
}

return M
