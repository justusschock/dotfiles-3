require'toggleterm'.setup {
    direction = 'float',
    on_open = function(term)
        vim.cmd("startinsert!")
        vim.api.nvim_buf_set_keymap(term.bufnr, "t", "<C-t>", "<cmd>ToggleTerm<CR>", {noremap = true, silent = true}) -- Adds toggle term command keymap to current buffer
        vim.api.nvim_buf_set_keymap(term.bufnr, "t", "<C-n>", "<C-\\><C-n>", {noremap = true, silent = true}) -- Adds keymap to current buffer to get back to normal mode easier
    end, 
}

local Terminal  = require('toggleterm.terminal').Terminal

-- create lazygit terminal
local lazygit = Terminal:new({ 
    cmd = "lazygit", 
    hidden = true,
    on_open = function(term)
        vim.cmd("startinsert!")
        vim.api.nvim_buf_set_keymap(term.bufnr, "t", "<C-l>", "<cmd>ToggleLazyGitTerm<CR>", {noremap = true, silent = true}) -- Adds toggle lazy git term keymap to current buffer
        vim.api.nvim_buf_set_keymap(term.bufnr, "t", "<C-n>", "<C-\\><C-n>", {noremap = true, silent = true}) -- Adds keymap to current buffer to get back to normal mode easier
    end
     
})
-- create toggle endpoint function
function _lazygit_toggle()
    lazygit:toggle()
end
-- create user commands for lazy git and conda
vim.api.nvim_create_user_command('ToggleLazyGitTerm', _lazygit_toggle, { bang = true })

-- conda is handled by the telescope-conda extension.

