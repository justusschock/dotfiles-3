-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
-- auto-reload files when modified externally
-- https://unix.stackexchange.com/a/383044
local cmd = vim.api.nvim_create_autocmd
vim.o.autoread = true
cmd({ "BufEnter", "CursorHold", "CursorHoldI", "FocusGained" }, {
  command = "if mode() != 'c' | checktime | endif",
  pattern = { "*" },
})

cmd("FileType", {
  desc = "Dump Servername to /tmp/curvimserver",
  callback = function()
    file = io.open("/tmp/curvimserver", "w")
    io.output(file)
    io.write(vim.v.servername)
    io.close(file)
  end,
  pattern = "*.tex"
})