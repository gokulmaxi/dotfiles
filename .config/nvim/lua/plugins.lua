local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
    execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
    execute "packadd packer.nvim"
end

--- Check if a file or directory exists in this path
local function require_plugin(plugin)
    local plugin_prefix = fn.stdpath("data") .. "/site/pack/packer/opt/"

    local plugin_path = plugin_prefix .. plugin .. "/"
    --	print('test '..plugin_path)
    local ok, err, code = os.rename(plugin_path, plugin_path)
    if not ok then
        if code == 13 then
            -- Permission denied, but it exists
            return true
        end
    end
    --	print(ok, err, code)
    if ok then
        vim.cmd("packadd " .. plugin)
    end
    return ok, err, code
end

vim.cmd "autocmd BufWritePost plugins.lua PackerCompile" -- Auto compile when there are changes in plugins.lua

return require('packer').startup(function()

    -- Packer can manage itself as an optional plugin
    use {'wbthomason/packer.nvim'}
    -- LSP config
    use {'neovim/nvim-lspconfig'}
    use {"glepnir/lspsaga.nvim"}
    use{"kabouzeid/nvim-lspinstall"}
    use {'sbdchd/neoformat'}
    -- Snippets
    use {'hrsh7th/vim-vsnip'}
    use {'rafamadriz/friendly-snippets'}
    use { 'SirVer/ultisnips'}
    -- Lua development
    use {'tjdevries/nlua.nvim'}
    -- debug adapter
    use 'mfussenegger/nvim-dap'

    use 'Pocco81/DAPInstall.nvim'

    -- DAP UI
    use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }
    -- Better syntax
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }
    --colorise the colors in buf 
    --TODO Not working err: set termgui true
    use {'norcalli/nvim-colorizer.lua'}
    -- file tree
    use {"kyazdani42/nvim-tree.lua"}
    -- Autocomplete with native lspPlug 'hrsh7th/cmp-nvim-lsp'
    use {"hrsh7th/nvim-cmp"}
    use{'hrsh7th/cmp-vsnip'}
    use{'hrsh7th/cmp-omni'}
    use{'quangnguyen30192/cmp-nvim-ultisnips'}
    use{'hrsh7th/cmp-buffer'}
    use{'hrsh7th/cmp-path'}
    use{'kdheepak/cmp-latex-symbols'}
    use{'hrsh7th/cmp-nvim-lsp'}
    -- nvim telescope 
    use {
        'nvim-telescope/telescope.nvim',
        requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
    }
    --telescope fuzzy finder
    use {
        'nvim-telescope/telescope-fzf-native.nvim',
        run = 'make'
    }
    -- Status Line and Bufferline
    use {"glepnir/galaxyline.nvim"}
    -- easy tab management
    use {"romgrk/barbar.nvim"}
    -- Markdown preview inside nvim
    use {'mzlogin/vim-markdown-toc'}
    use {
        'iamcco/markdown-preview.nvim',
        run = 'cd app && yarn install'
    }
    -- align text and symbols in a line
    use {'godlygeek/tabular'}

    use {'plasticboy/vim-markdown'}
    -- which key to pop up keybindings
    use {"folke/which-key.nvim"}
    -- dev icons
    use {"kyazdani42/nvim-web-devicons"}
    -- auto pair braces with seperate colors
    use {"windwp/nvim-autopairs"}
    use {"terrortylor/nvim-comment"}
    --rainbow coloriser
    use {"p00f/nvim-ts-rainbow"} 
    --ctags
    use('preservim/tagbar')
    -- floatterm inside nvim
    use('voldikss/vim-floaterm')
    --docxygen toolkit for nvim 
    use('vim-scripts/DoxygenToolkit.vim')
    -- signature for autocompletion 
    use ("ray-x/lsp_signature.nvim")
    -- gruvbox theme
    use {"npxbr/gruvbox.nvim", requires = {"rktjmp/lush.nvim"}}
    --autosave plugin
    use "Pocco81/AutoSave.nvim"
    -- xml helper
    use "sukima/xmledit"
    use "lervag/vimtex"
    use 'GoldsteinE/compe-latex-symbols'
    -- use 'brennier/quicktex'
    use 'xuhdev/vim-latex-live-preview'
    -- conceals latex texts
    use 'KeitaNakamura/tex-conceal.vim'
    use 'matze/vim-tex-fold'
end)
