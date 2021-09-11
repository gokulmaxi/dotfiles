require'lspconfig'.clangd.setup {
    on_attach =function (client,bufnr)
        require'lsp'.common_on_attach(client,bufnr)
        require "lsp_signature".on_attach()
    end,
    handlers = {
        ["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
            virtual_text = true,
            signs = true,
            underline = true,
            update_in_insert = true

        })
    }
}
