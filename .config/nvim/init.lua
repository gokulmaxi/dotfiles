-- Map leader to space
vim.g.mapleader = ' '
vim.g.maplocalleader = ','

require('globals')
-- Install plugins
require('plugins')
-- load config
require('config')

-- Sensible defaults
require('settings')
--load keymapping
require('keymapping')
--load lsp config
require('lang')
require('c-per')
