local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

return packer.startup(function(use)
    -- Packer can manage itself
    use { "wbthomason/packer.nvim" }

    -- LSP
    use { "neovim/nvim-lspconfig" }
    use { "williamboman/mason.nvim" }

    -- CMP
    use { "hrsh7th/nvim-cmp" }
    use { "hrsh7th/cmp-buffer" }
    use { "hrsh7th/cmp-nvim-lsp" }
    use { "saadparwaiz1/cmp_luasnip" }

    -- Snippet
    use { "L3MON4D3/LuaSnip" }

    -- Colorscheme
    use { "projekt0n/github-nvim-theme" }

    -- Statusline
    use { "nvim-lualine/lualine.nvim" }

    -- File explorer
    use { "nvim-tree/nvim-tree.lua" }

    -- Icons
    use { "kyazdani42/nvim-web-devicons" }

    -- Autopairs
    use { "windwp/nvim-autopairs" }

    -- Indent guides
    use { "lukas-reineke/indent-blankline.nvim" }
end)
