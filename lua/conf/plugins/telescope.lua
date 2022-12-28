local M = {
    "nvim-telescope/telescope.nvim",
    cmd = {"Telescope"},
}

function M.config()
    local telescope = require("telescope")
    telescope.setup {
        defaults = {
            vimgrep_arguments = {
                "rg",
                "--color=never",
                "--no-heading",
                "--with-filename",
                "--line-number",
                "--column",
                "--smart-case",
                "--hidden"
            },
            prompt_position = "bottom",
            prompt_prefix = " ",
            file_ignore_patterns = { "undodir", "env", "__pycache__", "plugged", "undodir", "pack", ".cache", ".git" },
            selection_caret = "  ",
            path_display = { "smart" },
            color_devicons = true,
            set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
        },
        extensions = {
            fzy_native = {
                override_generic_sorter = false,
                override_file_sorter = true,
                case_mode = "smart_case",
            },
            ["ui-select"] = {
                require("telescope.themes").get_dropdown {
                    layout_config = { width = 0.4, height = 0.4 },
                    border = true,
                    previewer = false,
                },
            },
            media_files = {

                filetypes = { "png", "webp", "jpg", "jpeg" },
                find_cmd = "rg", -- find command (defaults to `fd`)
            },
        },

    }
end


return M
