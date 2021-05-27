vim.api.nvim_set_keymap('n', '<TAB>', ':BufferNext<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<S-TAB>', ':BufferPrevious<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<S-x>', ':BufferClose<CR>', { noremap = true, silent = true })
--for closing non closable debug console
--TODO set this to be automatic while closing debugging session
vim.api.nvim_set_keymap('n', '<S-q>', ':BufferClose!<CR>', { noremap = true, silent = true })