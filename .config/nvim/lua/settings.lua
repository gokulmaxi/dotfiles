

local cmd = vim.cmd
local o = vim.o
local wo = vim.wo
local bo = vim.bo
local indent = 4

cmd 'syntax enable'
cmd 'filetype plugin indent on'

bo.shiftwidth = indent
bo.tabstop = indent
bo.softtabstop = indent
o.termguicolors = true
o.hidden = true
o.ignorecase = true
o.scrolloff = 4
o.splitbelow = true
o.splitright = true
o.wildmode = 'list:longest'
o.clipboard = 'unnamed,unnamedplus'
o.timeoutlen = 500
wo.number = true
wo.relativenumber = false
wo.scrolloff = 8
wo.cursorline = true

cmd [[
set expandtab smarttab shiftround autoindent smartindent smartcase
]]

-- Highlight on yank
cmd 'au TextYankPost * lua vim.highlight.on_yank {on_visual = false}'
--TODO make auto format work
-- Auto format
-- vim.api.nvim_exec([[
-- augroup auto_fmt
--     autocmd!
--     autocmd BufWritePre *.py,*.lua try | undojoin | Neoformat | catch /^Vim\%((\a\+)\)\=:E790/ | finally | silent Neoformat | endtry
-- aug END
-- ]], false)

vim.api.nvim_exec([[
augroup auto_spellcheck
    autocmd!
    autocmd BufNewFile,BufRead *.md setlocal spell
    autocmd BufNewFile,BufRead *.org setfiletype markdown
    autocmd BufNewFile,BufRead *.org setlocal spell
    autocmd BufNewFile,BufRead *.html setlocal ts=2 sw=2 expandtab
    autocmd BufNewFile,BufRead *.js setlocal ts=2 sw=2 expandtab
    autocmd BufNewFile,BufRead *.json setlocal syntax=off expandtab
augroup END
]], false)

vim.api.nvim_exec([[
augroup auto_term
    autocmd!
    autocmd TermOpen * setlocal nonumber norelativenumber
    autocmd TermOpen * startinsert
augroup END
]], false)

vim.api.nvim_exec([[
    fun! TrimWhitespace()
        let l:save = winsaveview()
        keeppatterns %s/\s\+$//e
        call winrestview(l:save)
    endfun
    autocmd FileType go,rust,html,typescript,javascript,python autocmd BufWritePre <buffer> call TrimWhitespace()
]], false)
--set colour scheme and use transparent background
cmd 'colorscheme nord'
vim.cmd [[ silent! hi Normal guibg=none ctermbg=none ]]

