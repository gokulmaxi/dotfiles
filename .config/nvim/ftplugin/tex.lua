require'lspconfig'.texlab.setup{}
vim.g.diagnostic_enable_virtual_text = 0
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
]]


