require('lsp')

local cmd = vim.cmd
local o = vim.o
local wo = vim.wo
local bo = vim.bo
local indent = 4

cmd 'syntax enable'
cmd 'filetype plugin indent on'
cmd 'set encoding=UTF-8'
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
o.relativenumber=true

--auto complete
vim.o.completeopt = "menuone,noselect"

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
    autocmd BufNewFile,BufRead *.launch setfiletype xml
    autocmd BufNewFile,BufRead *.world setfiletype xml
    autocmd BufNewFile,BufRead *.urdf setfiletype xml
    autocmd BufNewFile,BufRead *.sdf setfiletype xml
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
        let l:save = winsaveview() ..
        
        keeppatterns %s/\s\+$//e
        call winrestview(l:save)
    endfun
    autocmd FileType go,rust,html,typescript,javascript,python autocmd BufWritePre <buffer> call TrimWhitespace()
]], false)
--set colour scheme and use transparent background
vim.o.background = "dark" -- or "light" for light mode
vim.cmd([[colorscheme gruvbox]])
vim.cmd [[ silent! hi Normal guibg=none ctermbg=none ]]
--easy esc 
vim.cmd [[imap <C-space> <Esc>]]
vim.cmd [[map <F8> :w <CR> :!gcc -g ./% -o %< && %< <CR>]]
CONFIG_PATH = vim.fn.stdpath('config')
DATA_PATH = vim.fn.stdpath('data')
CACHE_PATH = vim.fn.stdpath('cache')
vim.cmd [[let g:mkdp_browser = 'firefox']]
vim.cmd [[let g:livepreview_previewer = 'kitty zathura']]
