local status_ok, treesitter = pcall(require, "nvim-treesitter.configs")
if not status_ok then
    return
end

treesitter.setup {
    -- A list of parser names, or "all"
    ensure_installed = {
        "bash",
        "c",
        "lua"
    },

    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,

    -- Automatically install missing parsers when entering buffer
    auto_install = true,

    -- List of parsers to ignore installing
    ignore_install = { "" },

    highlight = {
        -- `false` will disable the whole extension
        enable = true,

        -- List of language that will be disabled
        disable = { "" },

        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        additional_vim_regex_highlighting = false
    },

    rainbow = {
        -- Rainbow parentheses for neovim using tree-sitter
        enable = true,

        -- List of languages you want to disable the plugin for
        disable = { "" },

        -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
        extended_mode = true,

        -- Do not enable for files with more than n lines, int
        max_file_lines = nil
    },

    -- Indentation based on treesitter
    indent = { enable = true },

    autopairs = { enable = true }
}
