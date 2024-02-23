--
-- [[ LazyVim plugin manager ]]
--
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

--
-- [[ Configure Plugins ]]
--
-- NOTE: Here is where you install your plugins.
-- You can configure plugins using the `config` key.
--
-- You can also configure plugins after the setup call,
-- as they will be avaliable in your neovim runtime.
require("lazy").setup({
  -- TODO:
  -- 'lewis6991/gitsigns.nvim',

  --
  -- [[ LSP ]]
  --
  {
    -- Quickstart configs for Nvim LSP
    "neovim/nvim-lspconfig",
    dependencies = {
      -- Automatically install LSPs to stdpath for neovim
      { "williamboman/mason.nvim", config = true },
      "williamboman/mason-lspconfig.nvim",

      -- Additional lua configuration, makes neovim stuff amazing!
      "folke/neodev.nvim",

      -- Useful status updates for LSP
      { "j-hui/fidget.nvim", opts = {} },
    },
  },

  --
  -- [[ Autocompletion ]]
  --
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      -- Snippet Engine & its associated nvim-cmp source
      {
        'L3MON4D3/LuaSnip',
        build = (function()
          -- Build Step is needed for regex support in snippets
          -- This step is not supported in many windows environments
          -- Remove the below condition to re-enable on windows
          if vim.fn.has 'win32' == 1 then
            return
          end
          return 'make install_jsregexp'
        end)(),
      },
      'saadparwaiz1/cmp_luasnip',

      -- Adds LSP completion capabilities
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',

      -- Adds a number of user-friendly snippets
      'rafamadriz/friendly-snippets',
    },
  },

  --
  -- [[ Treesitter ]]
  --
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
  },

  --
  -- [[ Fuzzy Finder ]]
  --
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

  --
  -- [[ Useful plugin to show you peding keybinds ]]
  --
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {},
  },

  --
  -- [[ Status line ]]
  --
  {
    "nvim-lualine/lualine.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
  },

  --
  -- [[ Indentation guides ]]
  --
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {}
  },

  --
  -- [[ Smart comments ]]
  --
  {
    "numToStr/Comment.nvim",
    opts = {},
    lazy = false,
  },

  --
  -- [[ Autopairs ]]
  --
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {},
  },

  --
  -- [[ Colorscheme ]]
  --
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
  },
})
