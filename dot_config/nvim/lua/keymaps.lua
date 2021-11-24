-----------------------------------------------------------
-- Keymaps configuration file: keymaps of neovim
-- and plugins.
-----------------------------------------------------------

local map = vim.api.nvim_set_keymap
local default_opts = { noremap = true, silent = true }
local cmd = vim.cmd

-----------------------------------------------------------
-- Neovim shortcuts:
-----------------------------------------------------------

-- clear search highlighting
map('n', '<leader>c', ':nohl<CR>', default_opts)

-- map Esc to kk
map('i', 'kk', '<Esc>', {noremap = true})

-- don't use arrow keys
map('', '<up>', '<nop>', { noremap = true })
map('', '<down>', '<nop>', { noremap = true })
map('', '<left>', '<nop>', { noremap = true })
map('', '<right>', '<nop>', { noremap = true })

-- fast saving with <leader> and s
map('n', '<leader>s', ':w<CR>', default_opts)
map('i', '<leader>s', '<C-c>:w<CR>', default_opts)

-- move around splits using Ctrl + {h,j,k,l}
map('n', '<C-h>', '<C-w>h', default_opts)
map('n', '<C-j>', '<C-w>j', default_opts)
map('n', '<C-k>', '<C-w>k', default_opts)
map('n', '<C-l>', '<C-w>l', default_opts)

-- close all windows and exit from neovim
map('n', '<leader>q', ':qa!<CR>', default_opts)

-----------------------------------------------------------
-- Applications & Plugins shortcuts:
-----------------------------------------------------------
-- open terminal
map('n', '<C-t>', ':Term<CR>', { noremap = true })

-- nvim-tree
map('n', '<C-n>', ':NvimTreeToggle<CR>', default_opts)       -- open/close
map('n', '<leader>r', ':NvimTreeRefresh<CR>', default_opts)  -- refresh
map('n', '<leader>n', ':NvimTreeFindFile<CR>', default_opts) -- search file

-- Vista tag-viewer
map('n', '<C-m>', ':Vista!!<CR>', default_opts)   -- open/close

map('n', '<leader><space>',':nohlsearch<CR>', default_opts)

-- Moving through buffers
map('n', '<Tab', ':bnext<CR', default_opts)
map('n', '<S-Tab', ':bprevious<CR', default_opts)



-- " TMUX {{{
-- " allows cursor change in tmux mode
-- if exists('$TMUX')
--     let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
--     let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
-- else
--     let &t_SI = "\<Esc>]50;CursorShape=1\x7"
--     let &t_EI = "\<Esc>]50;CursorShape=0\x7"
-- endif
-- "  }}}


-- " Custom Functions {{{
-- " toggle between number and relativenumber
-- function! ToggleNumber()
--     if(&relativenumber == 1)
--         set norelativenumber
--         set number
--     else
--         set relativenumber
--     endif
-- endfunc

-- " strips trailing whitespace at the end of files. this
-- " is called on buffer write in the autogroup above.
-- function! <SID>StripTrailingWhitespaces()
--     " save last search & cursor position
--     let _s=@/
--     let l = line(".")
--     let c = col(".")
--     %s/\s\+$//e
--     let @/=_s
--     call cursor(l, c)
-- endfunction

-- " }}}

