local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable branch
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  -- [[ Colorscheme ]]
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
  },

  -- [[ LSP Plugins ]]
  {
    -- Quickstart configs for Nvim LSP
    "neovim/nvim-lspconfig",
  },

  -- [[ Fuzzy Finder (files, lsp, etc) ]]
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      -- Fuzzy Finder Algorithm which requires local dependencies to be build.
      -- Only load if `make` is avaliable.
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
        cond = function()
          return vim.fn.executable "make" == 1
        end,
      },
    },
  },
})
