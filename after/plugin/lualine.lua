local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
    return
end

lualine.setup {
    options = {
        component_separators = { left = '', right = ''},
        section_separators = { left = '', right = ''},
        ignore_focus = { "NvimTree" },
        globalstatus = true
    }
}
