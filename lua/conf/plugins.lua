local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
-- vim.cmd [[
--   augroup packer_user_config
--     autocmd!
--     autocmd BufWritePost plugins.lua source <afile> | PackerSync
--   augroup end
-- ]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

return packer.startup(function(use)
  -- Automatically set up your configuration after cloning packer.nvim
  -- misc
  use 'wbthomason/packer.nvim'
  use "nvim-lua/popup.nvim"
  use "nvim-lua/plenary.nvim"
  use "kyazdani42/nvim-web-devicons"
  use "kyazdani42/nvim-tree.lua"
  use "akinsho/bufferline.nvim"
  use 'famiu/bufdelete.nvim'
  use "nvim-lualine/lualine.nvim"
  use "goolord/alpha-nvim"

  -- Git
  use "lewis6991/gitsigns.nvim"

  -- Telescope
  use "nvim-telescope/telescope.nvim"
  use "nvim-telescope/telescope-ui-select.nvim"
  use 'nvim-telescope/telescope-project.nvim'
  use "https://github.com/nvim-telescope/telescope-media-files.nvim"

  -- cmp lsp
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'
  use 'mfussenegger/nvim-dap'
  use 'jose-elias-alvarez/null-ls.nvim'
  use 'folke/neodev.nvim'
  use 'j-hui/fidget.nvim'


  use "mfussenegger/nvim-jdtls"

  -- For luasnip users.
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'

  -- colorschemes
  use 'shaunsingh/nord.nvim'
  use 'ellisonleao/gruvbox.nvim'
  use 'navarasu/onedark.nvim'
  --  use 'folke/tokyonight.nvim '

  -- TreeSitter

  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }
  use "windwp/nvim-ts-autotag"
  use "windwp/nvim-autopairs"
  use "p00f/nvim-ts-rainbow"
  use "nvim-treesitter/nvim-treesitter-refactor"
  use "JoosepAlviste/nvim-ts-context-commentstring"
  use "numToStr/Comment.nvim"


  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
