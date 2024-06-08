return {
  {
    'echasnovski/mini.nvim',
    version = false,
    enabled = true,

    config = function ()
      require('mini.indentscope').setup()
    end
  },
}
