local status_ok, packer = pcall(require, 'packer')
if not status_ok then
    return
end

return packer.startup(function(use)
    -- Packer can manage itself
    use { 'wbthomason/packer.nvim' }

    -- Colorscheme
    use { 'projekt0n/github-nvim-theme' }

    -- Statusline
    use { 'nvim-lualine/lualine.nvim' }

    -- File explorer
    use { 'nvim-tree/nvim-tree.lua' }

    -- Icons
    use { 'kyazdani42/nvim-web-devicons' }
end)
