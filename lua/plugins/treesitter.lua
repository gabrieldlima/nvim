return {
  {
    "nvim-treesitter/nvim-treesitter",
    enabled = true,
    build = ":TSUpdate",
    main = "nvim-treesitter.configs", -- Sets main module to use for opts

    opts = {
      ensure_installed = {
        "bash",
        "c",
        "diff",
        "html",
        "json",
        "lua",
        "luadoc",
        "markdown",
        "markdown_inline",
        "nix",
        "python",
        "query",
        "rust",
        "vim",
        "vimdoc",
      },

      sync_install = false,
      auto_install = true,
      ignore_install = {},

      highlight = {
        enable = true,
        disable = {},
        additional_vim_regex_highlighting = false,
      },
      indent = {
        enable = true,
        disable = {},
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-space>",
          scope_incremental = false,
          node_incremental = "<C-space>",
          node_decremental = "<bs>",
        },
      },
    }
  }
}
