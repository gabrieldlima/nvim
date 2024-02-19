local o = vim.o

-- UTF-8
o.fileencoding = "utf-8"

-- Make line numbers default
o.number = true

-- Show the line number relative to the line with the cursor
o.relativenumber = true

-- Keep signcolumn on by default
o.signcolumn = "yes"

-- Tabs
o.expandtab = true
o.tabstop = 2
o.softtabstop = 2
o.shiftwidth = 2

-- When there is a previous search pattern, highlight all its matches
o.hlsearch = false

-- Case-insensitive searching
o.ignorecase = true
o.smartcase = true

-- No wrap long lines
o.wrap = false

-- Show (partial) command in the last line of the screen
o.showcmd = false

-- Highlight the text line of the cursor
o.cursorline = true

-- Decrease update time
o.updatetime = 250
o.timeoutlen = 300

-- Save undo history
o.undofile = false

-- Sync clipboard between OS and Neovim
o.clipboard = "unnamedplus"

-- Set completeopt to have a better completion experience
o.completeopt = "menuone,noselect"

-- Disable mouse support
o.mouse = ""

-- Enable 24-bit RGB color
o.termguicolors = true
