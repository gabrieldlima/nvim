-- Set <space> as the leader key
-- NOTE: Must happen before plugins are required
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- [[ Setting options ]]
require("options")

-- [[ Basic keymaps ]]
require("keymaps")

-- [[ Install lazy.nvim plugin manager ]]
require("lazyvim")

-- [[ Configure plugins ]]
require("colorscheme")

-- [[ Configure Telescope ]]
require("nvim-telescope")

-- [[ Configure Treesitter ]]
require("treesitter")

-- [[ Configure LSP ]]
require("lsp")
