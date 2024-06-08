return {
  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    enabled = true,

    config = function ()
      require("nvim-surround").setup()
    end
  }
}
