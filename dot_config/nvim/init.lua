-- Packer
pcall(require, "impatient") -- Speeding things up
require('plugins')
require('settings')
require('settings.color')
require('settings.font')
require('settings.completion')
require('settings.filetype')
-- LSP Config
require('lsp')
-- Keymap
require('settings.keymap').setup()
