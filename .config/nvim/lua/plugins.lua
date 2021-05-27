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
    use {'sbdchd/neoformat'}
    -- Snippets
    use {'hrsh7th/vim-vsnip'}
    use {'rafamadriz/friendly-snippets'}
    -- Lua development
    use {'tjdevries/nlua.nvim'}

    --     -- Better syntax
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }
    use {'norcalli/nvim-colorizer.lua'}
    use {"kyazdani42/nvim-tree.lua"}
    -- Autocomplete
    use {
        "hrsh7th/nvim-compe",
    }

    use {
        'nvim-telescope/telescope.nvim',
        requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
    }
    use {
        'nvim-telescope/telescope-fzf-native.nvim',
        run = 'make'
    }
    -- Status Line and Bufferline
    use {"glepnir/galaxyline.nvim"}
    use {"romgrk/barbar.nvim"}
    -- themes
    use {'arcticicestudio/nord-vim'}
    use {'sainnhe/gruvbox-material'}
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
    -- which key to pop up keybindings
    use {"folke/which-key.nvim"}
    -- dev icons
    use {"kyazdani42/nvim-web-devicons"}
    use {"windwp/nvim-autopairs"}
    use {"terrortylor/nvim-comment"}
    use {"kevinhwang91/nvim-bqf"}
    --rainbow coloriser
    use {"p00f/nvim-ts-rainbow"} 
    --ctags
    use('preservim/tagbar')
    --codi
    use('metakirby5/codi.vim')
end)
