cPer = {}

function cPer.startDebuging()
    -- vim.cmd [[call vimspector#Reset()]]
--<CR> :!gcc -g % -o %< && %< <CR>
    vim.cmd [[:w ]]
    vim.cmd [[:!gcc % -g -o %<]]
    vim.cmd [[:call vimspector#Launch()]]
end
function cPer.runCode()
        vim.cmd [[]]
end
        return cPer
