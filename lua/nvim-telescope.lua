local builtin = require("telescope.builtin")
local actions = require("telescope.actions")

require("telescope").setup {
  defaults = {
    mappings = {
      i = {
        ["<esc>"] = actions.close,
      },
    },
  },
}

-- Enable telescope fzf native, if installed
pcall(require("telescope").load_extension, "fzf")

vim.keymap.set('n', "<leader>ss", builtin.builtin, { desc = "[S]earch [S]elect Telescope" })
vim.keymap.set('n', "<leader>gf", builtin.git_files, { desc = "Search [G]it [F]iles" })
vim.keymap.set('n', "<leader>sf", builtin.find_files, { desc = "[S]earch [F]iles" })
vim.keymap.set('n', "<leader>sh", builtin.help_tags, { desc = "[S]earch [H]elp" })
vim.keymap.set('n', "<leader>sw", builtin.grep_string, { desc = "[S]earch current [W]orld" })
vim.keymap.set('n', "<leader>sg", builtin.live_grep, { desc = "[S]earch by [G]rep" })
vim.keymap.set('n', "<leader>sb", builtin.buffers, { desc = "[S]earch [B]uffers" })
vim.keymap.set('n', "<leader>sd", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })
vim.keymap.set('n', "<leader>sr", builtin.resume, { desc = "[S]earch [R]esume" })
