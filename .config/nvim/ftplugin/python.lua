local dap_install = require("dap-install")
require'lspconfig'.pyright.setup{
}

dap_install.config("python", {})