return {
  {
    "nvim-lualine/lualine.nvim",

    opts =  {
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
  }
}
