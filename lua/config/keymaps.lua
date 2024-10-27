-- Map Esc to `jk`
vim.keymap.set({ "i" }, "jk", "<Esc>", { silent = true })

-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Diagnostic keymaps
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- Disable arrow keys in normal mode :-)
vim.keymap.set("n", "<left>", "<cmd>echo '😡 Use h to move!!'<CR>")
vim.keymap.set("n", "<right>", "<cmd>echo '😡 Use l to move!!'<CR>")
vim.keymap.set("n", "<up>", "<cmd>echo '😡 Use k to move!!'<CR>")
vim.keymap.set("n", "<down>", "<cmd>echo '😡 Use j to move!!'<CR>")
