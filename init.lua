-- Set <space> as the leader key
-- NOTE: Must happen before plugins are required
vim.g.mapleader = " "

-- [[ Setting options ]]
require("options")

-- [[ Install lazy.nvim plugin manager ]]
require("lazyvim")

-- [[ Configure plugins ]]
require("colorscheme")

-- [[ Configure LSP ]]
-- require("lsp")

-- [[ Configure Telescope ]]
require("nvim-telescope")
