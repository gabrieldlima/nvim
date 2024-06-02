local g = vim.g
local opt = vim.opt

-- -----------------------------------------------------------------------------
-- Set the leader key
g.mapleader = ","
g.maplocalleader = ","


opt.breakindent    = true -- Every wrapped line will continue visually indented
opt.clipboard      = "unnamedplus" -- Sync with system clipboard
opt.completeopt    = "menu,menuone,noselect" -- A comma-separated list of options for Insert mode completion
opt.cursorline     = true -- Enable highlighting of the current line
opt.expandtab      = true -- Use spaces instead of tabs
opt.fileencoding   = "utf-8" -- File-content encoding for the current buffer
opt.ignorecase     = true -- Ignore case in search patterns
opt.inccommand     = "split" -- Preview incremental substitute
opt.list           = true -- Show some invisible characters (tabs, eol, ...)
opt.listchars      = { eol = "󰌑", tab = "» ", nbsp = "_" } -- Strings to use in "list" mode
opt.mouse          = "a" -- Enables mouse support in all modes
opt.number         = true -- Print the line number
opt.relativenumber = true -- Relative line numbers
opt.scrolloff      = 8 -- Minimal number of screen lines to keep above and below the cursor
opt.shiftwidth     = 2 -- Size of an indent
opt.showcmd        = false -- Don't show commands
opt.showmode       = false -- Don't show mode since we have a statusline
opt.signcolumn     = "yes" -- Always show the signcolumn
opt.smartcase      = true -- Don't ignore case with capitals
opt.splitbelow     = true -- Put new windows right of current
opt.splitright     = true -- Put new windows below current
opt.tabstop        = 2 -- Number of spaces tabs count for
opt.termguicolors  = true -- True color support
opt.timeoutlen     = 300 -- Time in milliseconds to wait for a mapped sequence to complete
opt.undofile       = true -- Enable undofile
opt.updatetime     = 250 -- Time in milliseconds that the swap file will be written to disk
opt.wrap           = false -- Disable line wrap
