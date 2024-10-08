return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },

    config = function ()
      require("lualine").setup {
        options = {
          theme = "catppuccin",
          globalstatus = true,
          component_separators = "|",
          section_separators = {left = '', right = ''},
        },
        sections = {
          -- +-------------------------------------------------+
          -- | A | B | C                             X | Y | Z |
          -- +-------------------------------------------------+
          lualine_a = {
            {"mode", icon = "", separator = { left = "", right = "" }, right_padding = 2 }
          },
          lualine_z = {
            {"location", separator = { left = "", right = "" }, left_padding = 2 }
          },
        },
      }
    end
  }
}
