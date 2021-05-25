-- Map leader to space
vim.g.mapleader = ' '
vim.g.maplocalleader = ','

local fn = vim.fn
local execute = vim.api.nvim_command
-- Install plugins
require('plugins')
-- Sensible defaults
require('settings')
-- load config
require('config')
--load keymapping
require('keymapping')
--load lsp config
require('lang')
