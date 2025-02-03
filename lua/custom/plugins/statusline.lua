return {
  {
    "nvim-lualine/lualine.nvim",

    opts =  {
      options = {
        theme = "catppuccin",
        globalstatus = true,
        component_separators = "",
      },
      sections = {
        -- +-------------------------------------------------+
        -- | A | B | C                             X | Y | Z |
        -- +-------------------------------------------------+
        lualine_a = {
          { "mode", icon = "", separator = { left = "", right = "" } },
        },
        lualine_b = {
          { "branch",      color = { bg = "#000000" } },
          { "diff",        color = { bg = "#000000" } },
          { "diagnostics", color = { bg = "#000000" } },
        },
        lualine_c = {
          { "filename",    color = { bg = "#000000" } },
        },
        lualine_x = {
          { "encoding",    color = { bg = "#000000" } },
          { "fileformat",  color = { bg = "#000000" } },
          { "filesize",    color = { bg = "#000000" } },
          { "filetype",    color = { bg = "#000000" } },
        },
        lualine_y = {
          { "progress",    color = { bg = "#000000" } },
        },
        lualine_z = {
          { "location", separator = { left = "", right = "" } },
        },
      },
    }
  }
}
