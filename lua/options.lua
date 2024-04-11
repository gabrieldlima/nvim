-- UTF-8
vim.opt.fileencoding = "utf-8"

-- Make line numbers default
vim.opt.number = true

-- Show the line number relative to the line with the cursor
vim.opt.relativenumber = true

-- Keep signcolumn on by default
vim.opt.signcolumn = "yes"

-- Enable break indent
vim.opt.breakindent = true

-- Tabs
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2

-- Minimal numbers of screen lines to keep above and below the cursor
vim.opt.scrolloff = 10

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace caracters in the editor
vim.opt.list = true
vim.opt.listchars = { eol = "󰌑", tab = "» ", nbsp = "_" }

-- When there is a previous search pattern, highlight all its matches
vim.opt.hlsearch = false

-- Case-insensitive searching
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- No wrap long lines
vim.opt.wrap = false

-- Show (partial) command in the last line of the screen
vim.opt.showcmd = false

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false

-- Highlight the text line of the cursor
vim.opt.cursorline = true

-- Decrease update time
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

-- Save undo history
vim.opt.undofile = false

-- Sync clipboard between OS and Neovim
vim.opt.clipboard = "unnamedplus"

-- Set completeopt to have a better completion experience
vim.opt.completeopt = "menuone,noselect"

-- Disable mouse support
vim.opt.mouse = "a"

-- Enable 24-bit RGB color
vim.opt.termguicolors = true
