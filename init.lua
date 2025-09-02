-- Options
vim.o.background = "dark"
vim.o.expandtab = true
vim.o.list = true
vim.o.listchars = "space:·"
vim.o.number = true
vim.o.relativenumber = true
vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.wrap = false

-- Plugins
vim.pack.add({
    { src = "https://github.com/ellisonleao/gruvbox.nvim" },
    { src = "https://github.com/nvim-mini/mini.pairs" }
})

-- Colorscheme
require("gruvbox").setup({
    contrast = "dark"
})
vim.cmd([[colorscheme gruvbox]])

-- Autopairs
require("mini.pairs").setup()
