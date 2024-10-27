-- Map Esc to `jk`
vim.keymap.set({ "i" }, "jk", "<Esc>", { silent = true })

-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
