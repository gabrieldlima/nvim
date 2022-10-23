local status_ok, github_nvim_theme = pcall(require, "github-theme")
if not status_ok then
    return
end

github_nvim_theme.setup {
    theme_style = "dark_default",
    comment_style = "italic",
    keyword_style = "italic",
    function_style = "NONE",
    variable_style = "NONE"
}
