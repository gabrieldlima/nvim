-- Set <space> as the leader key
-- NOTE: Must happen before plugins are required
vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("config")
require("plugins")
