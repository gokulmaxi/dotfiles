-- The nvim-cmp almost supports LSP's capabilities so You should advertise it to LSP servers..
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)
require'lspconfig'.texlab.setup{
          capabilities = capabilities,
}
vim.g.diagnostic_enable_virtual_text = 0
vim.g.tex_superscripts= "[0-9a-zA-W.,:;+-<>/()=]"
vim.g.tex_subscripts= "[0-9aehijklmnoprstuvx,+-/().]"
vim.cmd[[set conceallevel=2]]
vim.cmd [[
function! AddItem()
  let [end_lnum, end_col] = searchpairpos('\\begin{', '', '\\end{', 'nW')
  if match(getline(end_lnum), '\(itemize\|enumerate\|description\)') != -1
    return "\\item "
  else
    return ""
  endif
endfunction
]]

vim.cmd[[
noremap <expr><buffer> o "o".AddItem()
nnoremap <expr><buffer> O "O".AddItem()
autocmd FileType * exec("setlocal dictionary+=".$HOME."/.vim/dictionaries/".expand('<amatch>'))
set completeopt=menuone,longest,preview
set complete+=k
]]


