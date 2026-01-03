-- =============================================================================
-- Options
-- =============================================================================
vim.o.background = "dark"
vim.o.clipboard = "unnamedplus"
vim.o.expandtab = true
vim.o.list = true
vim.o.listchars = "space:·"
vim.o.number = true
vim.o.relativenumber = true
vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.wrap = false


-- =============================================================================
-- Keymaps
-- =============================================================================
vim.g.mapleader = " "
vim.keymap.set("i", "jk", "<Esc>")


-- =============================================================================
-- Plugins installation
-- =============================================================================
vim.pack.add({
    { src = "https://github.com/ellisonleao/gruvbox.nvim" },
    { src = "https://github.com/nvim-mini/mini.pairs" },
    { src = "https://github.com/nvim-lua/plenary.nvim" },
    { src = "https://github.com/nvim-tree/nvim-web-devicons" },
    { src = "https://github.com/nvim-telescope/telescope-fzf-native.nvim" },
    { src = "https://github.com/nvim-telescope/telescope.nvim" },
    { src = "https://github.com/nvim-treesitter/nvim-treesitter" },
})


-- =============================================================================
-- Plugins configuration
-- =============================================================================

-- Colorscheme
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
require("gruvbox").setup({
    contrast = "dark"
})
vim.cmd([[colorscheme gruvbox]])


-- Autopairs
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
require("mini.pairs").setup()


-- Telescope
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
local builtin = require("telescope.builtin")
require("telescope").load_extension("fzf")

vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "Telescope live grep" })
vim.keymap.set("n", "<leader>sb", builtin.buffers, { desc = "Telescope buffers" })
vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "Telescope help tags" })


-- Treesitter
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
require("nvim-treesitter").install ({ "c", "cpp", "python" })

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "c", "cpp", "python" },
  callback = function() vim.treesitter.start() end,
})
