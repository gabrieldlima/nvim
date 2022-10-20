local M = {}

local function bind(mode, options)
    options = options or { noremap = true }
    return function(lhs, rhs, opts)
        opts = vim.tbl_extend("force", options, opts or {})
        vim.keymap.set(mode, lhs, rhs, opts)
    end
end

M.nmap = bind('n', { noremap = false })
M.nnoremap = bind('n')
M.vnoremap = bind('v')
M.xnoremap = bind('x')
M.inoremap = bind('i')

return M
