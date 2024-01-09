-- Set <space> as the leader key
-- NOTE: Must happen before plugins are required
vim.g.mapleader = " "

-- [[ Setting optins ]]
require("options")

-- [[ Install lazy.nvim plugin manager ]]
require("lazyvim")

-- [[ Configure plugins ]]
require("colorscheme")
