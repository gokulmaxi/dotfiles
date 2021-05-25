return require('packer').startup(function()

    -- Packer can manage itself as an optional plugin
    use {
        'wbthomason/packer.nvim',
        opt = false
    }
    -- LSP config
    use {'neovim/nvim-lspconfig'}
    -- use { 'kabouzeid/nvim-lspinstall'}
    use {'sbdchd/neoformat'}
    -- Snippets
    use {'hrsh7th/vim-vsnip'}
    use {'rafamadriz/friendly-snippets'}
    --    use {'cstrap/python-snippets'}
    -- use {'nvim-lua/completion-nvim'}
    --    use {'ylcnfrht/vscode-python-snippet-pack'}
    --    use {'xabikos/vscode-javascript'}
    --    use {'golang/vscode-go'}
    --    use {'rust-lang/vscode-rust'}
    -- use { 'honza/vim-snippets' }
    -- use { 'SirVer/ultisnips' }
    -- use { 'norcalli/snippets.nvim' }
    -- use { 'nvim-telescope/telescope-snippets.nvim' }

    -- Lua development
    --    use {'tjdevries/nlua.nvim'}

    -- Plugin development
    --    use {'thinca/vim-themis'}
    --    use {'tpope/vim-scriptease'}
    --    use {'junegunn/vader.vim'}

    --     -- Better syntax
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }
    use {'norcalli/nvim-colorizer.lua'}

    -- Autocomplete
    use {
        "hrsh7th/nvim-compe",
        opt = true
    }

    use {
        'nvim-telescope/telescope.nvim',
        requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
    }
    use {
        'nvim-telescope/telescope-fzf-native.nvim',
        run = 'make'
    }

    -- themes
    use {'arcticicestudio/nord-vim'}
    use {'sainnhe/gruvbox-material'}
    use {"christianchiarulli/nvcode-color-schemes.vim", opt = true}
    --     -- Markdown
    use {
        'npxbr/glow.nvim',
        run = ':GlowInstall'
    }
    use {'mzlogin/vim-markdown-toc'}
    use {
        'iamcco/markdown-preview.nvim',
        run = 'cd app && yarn install'
    }
    use {'godlygeek/tabular'}
    use {'plasticboy/vim-markdown'}

    -- dev icons
    use {
        "kyazdani42/nvim-web-devicons",
        opt = true
    }
end)
