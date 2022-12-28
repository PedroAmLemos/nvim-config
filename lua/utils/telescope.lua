local themes = require "telescope.themes"
local builtin = require "telescope.builtin"
local previewers = require "telescope.previewers"

local delta = previewers.new_termopen_previewer {
  get_command = function(entry)
    if entry.status == "??" or "A " then
      return { "git", "-c", "core.pager=delta", "-c", "delta.side-by-side=false", "diff", entry.value }
    end
    return { "git", "-c", "core.pager=delta", "-c", "delta.side-by-side=false", "diff", entry.value .. "^!" }
  end,
}

-- FUNCTIONS
local M = {}

M.buffer_lines = function()
  builtin.current_buffer_fuzzy_find {
    prompt_title = "< buffer lines >",
    attach_mappings = function(prompt_bufnr, map)
      -- Paste line
      map("i", "<C-f>", function()
        local content = require("telescope.actions.state").get_selected_entry()
        require("telescope.actions").close(prompt_bufnr)
        vim.fn.append(vim.fn.line ".", content.display)
        vim.fn.execute "norm j"
      end)

      return true
    end,
  }
end

M.edit_neovim = function()
  local opts

  opts = themes.get_ivy {
    prompt_title = "~ dotfiles ~",
    shorten_path = false,
    cwd = "~/.config/nvim",
  }
  builtin.find_files(opts)
end

M.my_git_commits = function(opts)
  opts = opts or {}
  opts.previewer = delta

  builtin.git_commits(opts)
end

M.my_git_bcommits = function(opts)
  opts = opts or {}
  opts.previewer = delta

  builtin.git_bcommits(opts)
end

M.my_git_status = function(opts)
  opts = opts or {}
  opts.previewer = delta

  builtin.git_status(opts)
end

M.git_status = function()
  local opts = themes.get_dropdown {
    winblend = 10,
    border = true,
    previewer = false,
    shorten_path = false,
  }

  -- Can change the git icons using this.
  opts.git_icons = {
    changed = "M",
    new = "N",
  }

  builtin.git_status(opts)
end

function M.search_only_certain_files()
  builtin.find_files {
    find_command = {
      "rg",
      "--files",
      "--type",
      vim.fn.input "Type: ",
    },
  }
end

function M.lsp_code_actions()
  local opts = themes.get_cursor {
    winblend = 10,
    border = true,
    previewer = false,
    shorten_path = false,
  }

  require("telescope.builtin").lsp_code_actions(opts)
end

function M.lsp_references()
  require("telescope.builtin").lsp_references {
    layout_strategy = "vertical",
    layout_config = {
      prompt_position = "top",
    },
    sorting_strategy = "ascending",
    ignore_filename = false,
  }
end

function M.lsp_implementations()
  require("telescope.builtin").lsp_implementations {
    layout_strategy = "vertical",
    layout_config = {
      prompt_position = "top",
    },
    sorting_strategy = "ascending",
    ignore_filename = false,
  }
end

return M
