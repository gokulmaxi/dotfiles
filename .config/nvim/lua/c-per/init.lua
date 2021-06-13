cPer = {}

function cPer.startDebuging()
    -- vim.cmd [[call vimspector#Reset()]]
--<CR> :!gcc -g % -o %< && %< <CR>
    vim.cmd [[:w ]]
   if (vim.bo.filetype == "c") then
    vim.cmd [[:!gcc % -g -o %<]]
    end
    vim.cmd [[:call vimspector#Launch()]]
end
function cPer.runCode()
        vim.cmd [[:w]]
        if (vim.bo.filetype=="c") then
        vim.cmd [[:!gcc %  -o %< && %< ]]
        end
        if (vim.bo.filetype == "cpp") then
        vim.cmd [[:!g++ %  -o %< && %< ]]
        end
end
        return cPer
