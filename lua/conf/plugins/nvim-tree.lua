local M = {
  "kyazdani42/nvim-tree.lua",
  lazy = false,
}


function M.config()
  local icons = require "utils.icons"
  local utils = require "nvim-tree.utils"
  local nvim_tree = require"nvim-tree"

  nvim_tree.setup{
    hijack_directories = {
      enable = false,
    },
    ignore_ft_on_setup = {
      "startify",
      "dashboard",
      "alpha",
    },
    filters = {
      custom = { ".git" },
      exclude = { ".gitignore" },
    },
  
    update_cwd = true,
  
    renderer = {
      add_trailing = false,
      group_empty = false,
      highlight_git = false,
      highlight_opened_files = "none",
      root_folder_modifier = ":t",
      indent_markers = {
        enable = false,
        icons = {
          corner = "└ ",
          edge = "│ ",
          none = "  ",
        },
      },
      icons = {
        webdev_colors = true,
        git_placement = "before",
        padding = " ",
        symlink_arrow = " ➛ ",
        show = {
          file = true,
          folder = true,
          folder_arrow = true,
          git = true,
        },
        glyphs = {
          default = "",
          symlink = "",
          folder = {
            arrow_open = icons.ui.ArrowOpen,
            arrow_closed = icons.ui.ArrowClosed,
            default = "",
            open = "",
            empty = "",
            empty_open = "",
            symlink = "",
            symlink_open = "",
          },
          git = {
            unstaged = "",
            staged = "S",
            unmerged = "",
            renamed = "➜",
            untracked = "U",
            deleted = "",
            ignored = "◌",
          },
        },
      },
    },
    diagnostics = {
      enable = true,
      icons = {
        hint = icons.diagnostics.Hint,
        info = icons.diagnostics.Information,
        warning = icons.diagnostics.Warning,
        error = icons.diagnostics.Error,
      },
    },
    update_focused_file = {
      enable = true,
      update_cwd = true,
      ignore_list = {},
    },
  
    git = {
      enable = true,
      ignore = true,
      timeout = 500,
    },
    view = {
      width = 45,
      hide_root_folder = false,
      side = "left",
      -- auto_resize = true,

      number = false,
      relativenumber = false,
    },
  }

end

M.keys = {
  {"<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "Nvim-Tree"}
}


return M