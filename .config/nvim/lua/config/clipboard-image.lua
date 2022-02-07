require'clipboard-image'.setup {
  -- Default configuration for all typefile
  default = {
    img_dir = "img",
    img_dir_txt = "img",
    img_name = function () return os.date('%Y-%m-%d-%H-%M-%S') end,
    affix = "%s"
  },
  -- You can create configuration for ceartain filetype by creating another field (markdown, in this case)
  -- If you're uncertain what to name your field to, you can run `:set filetype?`
  -- Missing options from `markdown` field will be replaced by options from `default` field
  markdown = {
    img_dir = "src/assets/img",
    img_dir_txt = "/assets/img",
    affix = "![](%s)",
  },
  tex= {
    img_dir = "img",
    img_dir_txt = "",
    img_name = function()
        local cword = vim.fn.expand('<cword>')
        vim.fn.feedkeys("diw")
        return cword      end,
    affix = [[
\begin{figure}[H]
    \centering
    \includegraphics[width=0.8\textwidth]{%s}
    \caption{}
    \label{fig:}
\end{figure}
]],
  }
}
