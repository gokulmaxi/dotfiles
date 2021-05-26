-- Map leader to space
vim.g.mapleader = ' '
vim.g.maplocalleader = ','

local fn = vim.fn
local execute = vim.api.nvim_command
-- Install plugins
require('plugins')
-- load config
require('config')
--load lsp config
require('lang')
-- Sensible defaults
require('settings')
--load keymapping
require('keymapping')

--TODO lsp autocomplete not working