-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Special Terminal for lazygit and python
-- require('toggleterm')
-- local Terminal = require("toggleterm.terminal").Terminal
-- local lazygit = Terminal:new({ cmd = "lazygit", hidden = true ,
--   on_open=function(term)
--     vim.cmd("startinsert!")
--     vim.api.nvim_buf_set_keymap(term.bufnr, "t", "<C-t>", "<Cmd>LazyGit<CR>", {noremap = true, silent = true}) -- Adds toggle term command keymap to current buffer
--   end,
-- })

-- local python = Terminal:new({ cmd = "python", hidden=true , 
--   on_open=function(term)
--     vim.cmd("startinsert!")
--     vim.api.nvim_buf_set_keymap(term.bufnr, "t", "<C-t>", "<Cmd>PythonREPL<CR>", {noremap = true, silent = true}) -- Adds toggle term command keymap to current buffer
--   end,
-- })

-- function _LAZYGIT_TOGGLE()
--   lazygit:toggle()
-- end

-- function _PYTHON_TOGGLE()
--   python:toggle()
-- end

-- vim.api.nvim_create_user_command('LazyGit', _LAZYGIT_TOGGLE, { bang = true })
-- vim.api.nvim_create_user_command('PythonREPL', _PYTHON_TOGGLE, { bang = true })


-- -- Python Selection
-- telescope = require('telescope')
-- telescope.load_extension("conda")

-- function _activate_conda_env()
--   telescope.extensions.conda.conda{}
-- end
-- vim.api.nvim_create_user_command('CondaEnvSelect', _activate_conda_env, { bang = true })
