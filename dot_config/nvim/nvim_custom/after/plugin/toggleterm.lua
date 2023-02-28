local status_ok, toggleterm = pcall(require, 'toggleterm')
if not status_ok then
  return
end

toggleterm.setup({
  size = 20,
  open_mapping = [[<c-\>]],
  hide_numbers = true,
  shade_filetypes = {},
  shade_terminals = true,
  shading_factor = 2,
  start_in_insert = true,
  insert_mappings = true,
  persiste_size = true,
  direction = "float", -- 'vertical' | 'horizontal' | 'tab' | 'float'
  close_on_exit = true,
  shell = vim.o.shell,
  float_opts = {
    border = "curved",
    winblend = 0,
    highlights = {
      border = "Normal",
      background = "Normal",
    },
  },
  on_open = function(term)
    vim.cmd("startinsert!")
    
end, 
})

function _G.set_terminal_keymaps()
  local opts = { buffer = 0 }
  vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
  vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
  vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
  vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
  vim.keymap.set('t', '<C-t>', [[<cmd>ToggleTerm<CR>]], opts)
  vim.keymap.set('n', '<C-t>', [[<cmd>ToggleTerm<CR>]], opts)
  vim.keymap.set("t", "<C-n>", [[<C-\><C-n>]], opts) -- Adds keymap to current buffer to get back to normal mode easier 
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new({ cmd = "lazygit", hidden = true ,
  on_open=function(term)
    vim.cmd("startinsert!")
    vim.api.nvim_buf_set_keymap(term.bufnr, "t", "<C-t>", "<Cmd>LazyGit<CR>", {noremap = true, silent = true}) -- Adds toggle term command keymap to current buffer
  end,
})

local python = Terminal:new({ cmd = "python", hidden=true , 
  on_open=function(term)
    vim.cmd("startinsert!")
    vim.api.nvim_buf_set_keymap(term.bufnr, "t", "<C-t>", "<Cmd>PythonREPL<CR>", {noremap = true, silent = true}) -- Adds toggle term command keymap to current buffer
  end,
})

function _LAZYGIT_TOGGLE()
  lazygit:toggle()
end

function _PYTHON_TOGGLE()
  python:toggle()
end

vim.api.nvim_create_user_command('LazyGit', _LAZYGIT_TOGGLE, { bang = true })
vim.api.nvim_create_user_command('PythonREPL', _PYTHON_TOGGLE, { bang = true })
 