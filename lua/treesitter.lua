-- Defer Treesitter setup after first render to improve startup time of 'nvim {filename}'
vim.defer_fn(function()
  require("nvim-treesitter.configs").setup {
    -- Add languages to be installed here that you want installed for treesitter
    ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "nix" },

    -- Install parsers synchronously (only applied to 'ensure_installed')
    sync_install = false,
    -- Autoinstall languages that are not installed. Defaults to false (but you can change for yourself)
    auto_install = false,
    -- List of parsers to ignore installing
    ignore_install = {},
    -- You can specify additional Treesitter modules here: -- For example: -- playground = {--enable = true,--}
    modules = {},
    highlight = { enable = true },
    indent = { enable = true },
    incremental_selecion = {
      enable = true,
      keymaps = {
        init_selection = "<c-space>",
        node_incremental = "<c-space>",
        scope_incremental = "<c-s>",
        node_decremental = "<M-space>",
      },
    },
  }
end, 0)
