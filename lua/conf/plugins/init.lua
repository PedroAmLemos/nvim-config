return {
  "nvim-lua/popup.nvim", "nvim-lua/plenary.nvim",
  "kyazdani42/nvim-web-devicons",

  {
    "famiu/bufdelete.nvim",
    event = "BufAdd"
  },


  -- Git
  {
    "tpope/vim-fugitive",
    lazy = false
  },


  -- Telescope
  "nvim-telescope/telescope-ui-select.nvim",
  'nvim-telescope/telescope-project.nvim',
  "nvim-telescope/telescope-media-files.nvim",

  -- Mason
  "williamboman/mason-lspconfig.nvim",
  "jay-babu/mason-null-ls.nvim",

  -- Lsp Fidget
  {
    "j-hui/fidget.nvim",
    event = "BufReadPre",
    config = function()
      require "fidget".setup()
    end
  },
  "jose-elias-alvarez/typescript.nvim",





}
