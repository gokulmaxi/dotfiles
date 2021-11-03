require("indent_blankline").setup {
    char = "|",
    buftype_exclude = {"terminal"}
}
vim.opt.list = true
vim.opt.listchars:append("space:⋅")
vim.opt.listchars:append("eol:↴")
