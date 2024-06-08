return {
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    enabled = true,

    config = function ()
      require("nvim-autopairs").setup()
    end
  }
}
