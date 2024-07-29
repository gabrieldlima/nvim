return {
  {
    "nvim-treesitter/nvim-treesitter",
    enabled = true,
    build = ":TSUpdate",

    config = function ()
      require("nvim-treesitter.configs").setup {
        ensure_installed = {
          "bash",
          "c",
          "json",
          "lua",
          "markdown",
          "nix",
          "python",
        },

        sync_install = false,
        auto_install = true,
        ignore_install = {},

        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "<C-space>",
            node_incremental = "<C-space>",
            scope_incremental = false,
            node_decremental = "<bs>",
          },
        },
        indent = {
          enable = true,
        },
      }
    end
  }
}
