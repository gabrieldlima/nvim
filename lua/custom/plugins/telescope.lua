return {
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    event = "VimEnter",
    dependencies = {
      {
        "nvim-lua/plenary.nvim"
      },
      {
        "nvim-tree/nvim-web-devicons"
      },
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
        cond = function ()
          return vim.fn.executable "make" == 1
        end
      },
    },

    opts = {},

    config = function (_, opts)
      require("telescope").setup(opts)
      pcall(require("telescope").load_extension, "fzf")

      local builtin = require("telescope.builtin")
      vim.keymap.set("n", "<leader>sb", builtin.buffers,     { desc = "[S]earch [B]uffers"})
      vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })
      vim.keymap.set("n", "<leader>sf", builtin.find_files,  { desc = "[S]earch [F]iles" })
      vim.keymap.set("n", "<leader>sg", builtin.live_grep,   { desc = "[S]earch by [G]rep" })
      vim.keymap.set("n", "<leader>sh", builtin.help_tags,   { desc = "[S]earch [H]elp" })
      vim.keymap.set("n", "<leader>sk", builtin.keymaps,     { desc = "[S]earch [K]eymaps" })
      vim.keymap.set("n", "<leader>ss", builtin.builtin,     { desc = "[S]earch [S]elect Telescope" })
      vim.keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "[S]earch current [W]ord" })

      vim.keymap.set("n", "<leader>en", function ()
        builtin.find_files { cwd = vim.fn.stdpath "config", prompt_title = "Neovim Config" }
      end, { desc = "[S]earch [N]eovim [C]onfig" })

      vim.keymap.set("n", "<leader>e.", function ()
        builtin.find_files { cwd = os.getenv("HOME") .. "/.dotfiles", prompt_title = "Dotfiles" }
      end, { desc = "[S]earch [.]Dotfiles" })
    end
  }
}
