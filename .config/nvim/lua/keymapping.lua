local utils = require('utils')
utils.map('n', '<Leader>fv', '<Cmd>Telescope find_files<CR>')
-- utils.map('n', '<Leader>d', '<Cmd>call vimspector#Launch()<CR>')
--vimspector#Stop()
utils.map('n', '<Leader>ds', '<Cmd>call call vimspector#Reset()<CR>')

--easy escape
--inoremap inoremap <Leader><Tab> <ESC> <ESC>
--utils.map('i','<Leader><Tab> ','<ESC>')
-- utils.map("i", "<Tab>", "v:lua.tab_complete()", {
--     expr = true,
--     silent = true
-- })
-- utils.map("i", "<S-Tab>", "v:lua.s_tab_complete()", {
--     expr = true,
--     silent = true
-- })

