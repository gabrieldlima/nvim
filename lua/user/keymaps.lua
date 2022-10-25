local nmap = require("user.utils").nmap
local nnoremap = require("user.utils").nnoremap
local inoremap = require("user.utils").inoremap
local vnoremap = require("user.utils").vnoremap
local xnoremap = require("user.utils").xnoremap

vim.g.mapleader = ' '

-- Normal mode
nnoremap("<C-h>", "<C-w>h")
nnoremap("<C-j>", "<C-w>j")
nnoremap("<C-k>", "<C-w>k")
nnoremap("<C-l>", "<C-w>l")

-- Insert mode
inoremap("jk", "<Esc>")
