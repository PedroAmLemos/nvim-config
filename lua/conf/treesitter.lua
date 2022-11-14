local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  return
end

configs.setup {
  ensure_installed = "all",

  sync_install = false,
  ignore_install = { "" },
  matchup = {
    enable = true,
    disable = { "markdown" }
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
