return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,

    opts = {
      flavor = "mocha",
      color_overrides = {
        mocha = {
          base   = "#000000",
          mantle = "#000000",
          crust  = "#000000",
        },
      },
      custom_highlights = function (colors)
        return {
          WinSeparator = { bg = colors.base, fg = colors.blue },
        }
      end,
      integrations = {
        cmp = true,
        fidget = true,
        indent_blankline = {
          enabled = true,
          scope_color = "lavender",
        },
        telescope = true,
        treesitter = true,
      },
    },

    config = function(_, opts)
      require("catppuccin").setup(opts)
      vim.cmd.colorscheme("catppuccin")
    end
  }
}
