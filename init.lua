-- =============================================================================
-- Options
-- =============================================================================
vim.o.background = "dark"
vim.o.clipboard = "unnamedplus"
vim.o.expandtab = true
vim.o.laststatus = 3
vim.o.list = true
vim.o.listchars = "space:·"
vim.o.number = true
vim.o.relativenumber = true
vim.o.shiftwidth = 4
vim.o.signcolumn = "yes"
vim.o.tabstop = 4
vim.o.updatetime = 50
vim.o.winborder = "single"
vim.o.wrap = false


-- =============================================================================
-- Keymaps
-- =============================================================================
vim.g.mapleader = " "
vim.keymap.set("i", "jk", "<Esc>")

vim.keymap.set("n", "gd", vim.lsp.buf.definition)
vim.keymap.set("n", "gD", vim.lsp.buf.declaration)


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
    { src = "https://github.com/nvim-lualine/lualine.nvim" },
    { src = "https://github.com/saghen/blink.cmp", version = "v1.9.1" },
})


-- =============================================================================
-- Plugins configuration
-- =============================================================================

-- Colorscheme
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
require("gruvbox").setup({
    contrast = "dark",
    overrides = {
      SignColumn = { bg = "#000000" },
      StatusLine = { bg = "#000000" },
      DiagnosticSignWarn = { bg = "#000000", fg = "#fabd2f" },
      DiagnosticSignError = { bg = "#000000", fg = "#fb4934" },
      Pmenu = { bg = "#000000" },
      NormalFloat = { bg = "#000000" },
    },
})
vim.cmd([[colorscheme gruvbox]])


-- Status line
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
local custom_gruvbox = require("lualine.themes.gruvbox_dark")
custom_gruvbox.normal.c.bg  = "#000000"
custom_gruvbox.insert.c.bg = "#000000"
custom_gruvbox.visual.c.bg = "#000000"
custom_gruvbox.replace.c.bg = "#000000"
custom_gruvbox.command.c.bg = "#000000"
custom_gruvbox.inactive.c.bg = "#000000"

require("lualine").setup({
  options = {
    theme = custom_gruvbox,
    component_separators = "",
  },
  sections = {
    lualine_a = {
      { "mode", icon = "", separator = { left = "", right = "" } },
    },
    lualine_b = {
      { "branch",      color = { bg = "#000000", fg = "#ebdbb2" } },
      { "diff",        color = { bg = "#000000", fg = "#ebdbb2" } },
      { "diagnostics", color = { bg = "#000000", fg = "#ebdbb2" } },
    },
    lualine_c = {
      { "filename",    color = { bg = "#000000", fg = "#ebdbb2" } },
    },
    lualine_x = {
      { "encoding",    color = { bg = "#000000", fg = "#ebdbb2" } },
      { "fileformat",  color = { bg = "#000000", fg = "#ebdbb2" } },
      { "filesize",    color = { bg = "#000000", fg = "#ebdbb2" } },
      { "filetype",    color = { bg = "#000000", fg = "#ebdbb2" } },
    },
    lualine_y = {
      { "progress",    color = { bg = "#000000", fg = "#ebdbb2" } },
    },
    lualine_z = {
      { "location", separator = { left = "", right = "" } },
    },
  },
})


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
vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "Telescope diagnostics" })


-- Treesitter
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
require("nvim-treesitter").install ({ "c", "cpp", "python" })

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "c", "cpp", "python" },
  callback = function() vim.treesitter.start() end,
})


-- LSP configs
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
vim.lsp.config["lua_ls"] = {
  cmd = { "lua-language-server" },
  filetypes = { "lua" },
  root_markers = { { ".luarc.json", ".luarc.jsonc" }, ".git" },
  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT",
      }
    }
  }
}

vim.lsp.config["clangd"] = {
  cmd = { "clangd", "--background-index", "--clang-tidy", "--log=verbose" },
  filetypes = { "c", "cpp", "h", "hpp", "cxx" },
}


-- LSP enabled
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
vim.lsp.enable("lua_ls")
vim.lsp.enable("clangd")


-- Autocomplete
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
require("blink.cmp").setup({
  fuzzy = {
    implementation = "rust",
    prebuilt_binaries = {
      download = true,
      force_version = "v1.9.1"
    },
  },
  completion = {
    menu = {
      auto_show = true,
    },
    documentation = {
      auto_show = true,
      auto_show_delay_ms = 500,
    },
  }
})
