-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here



user_terminals = {}

function toggle_term_cmd(term_details, close_on_exit)
    if type(close_on_exit) == "nil" then
      close_on_exit = true
    end
    if type(term_details) == "string" then
      term_details = {
        cmd = term_details, 
        hidden = true,
        on_open = function(term)
          vim.cmd("startinsert!")
          vim.api.nvim_buf_set_keymap(term.bufnr, "t", "<C-t>", "<cmd>ToggleTerm<CR>", {noremap = true, silent = true}) -- Adds toggle term command keymap to current buffer
          vim.api.nvim_buf_set_keymap(term.bufnr, "t", "<C-n>", "<C-\\><C-n>", {noremap = true, silent = true}) -- Adds keymap to current buffer to get back to normal mode easier
          vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", {noremap = true, silent = true})
        end, 
        close_on_exit=close_on_exit,
        on_exit = function(t, job, exit_code, name)
          if exit_code == 0 then
            t:shutdown()
          end
        end,
      }
    end
    local term_key = term_details.cmd
    if vim.v.count > 0 and term_details.count == nil then
      term_details.count = vim.v.count
      term_key = term_key .. vim.v.count
    end
    if user_terminals[term_key] == nil then
      user_terminals[term_key] = require("toggleterm.terminal").Terminal:new(term_details)
    end
    user_terminals[term_key]:toggle()
end

function has(plugin)
    return require("lazy.core.config").plugins[plugin] ~= nil
end

local function map(mode, lhs, rhs, opts)
    local keys = require("lazy.core.handler").handlers.keys
    ---@cast keys LazyKeysHandler
    -- do not create the keymap if a lazy keys handler exists
    if not keys.active[keys.parse({ lhs, mode = mode }).id] then
      opts = opts or {}
      opts.silent = opts.silent ~= false
      vim.keymap.set(mode, lhs, rhs, opts)
    end
end



-- local maps = { n = {}, v = {}, t = {}, ["",}, i = {}, x = {}, s = {}, o = {} }

-- map("", "<Space>", "<Nop>")

-- Normal --
-- Standard Operations
map("n","<leader>w", "<cmd>w<cr>",  { desc = "Save" })
map("n","<leader>q", "<cmd>q<cr>",  { desc = "Quit" })
map("n","<leader>q", "<cmd>qa<cr>",  { desc = "Quit all" })
map("n","<leader>h", "<cmd>nohlsearch<cr>",  { desc = "No Highlight" })
map("n","<leader>fn", "<cmd>enew<cr>",  { desc = "New File" })
if vim.fn.has("nvim-0.9.0") == 1 then
    map("n","<leader>ui", vim.show_pos,  { desc = "Inspect Pos" })
end

map("n","<C-s>", "<cmd>w!<cr>",  { desc = "Force write" })
map("n","<C-q>", "<cmd>q!<cr>",  { desc = "Force quit" })
map("n","Q", "<Nop>")

-- Alpha
if has("alpha-nvim") then
    map("n","<leader>D", "<cmd>Alpha<cr>",  { desc = "Alpha Dashboard" })
end

-- Bufdelete
if has("bufdelete.nvim") then
    map("n","<leader>c", function() require("mini.bufremove").delete(0, false) end,  { desc = "Delete Buffer" })
    map("n","<leader>C", function() require("mini.bufremove").delete(0, true) end,  { desc = "Force Delete Buffer" })
else
    map("n","<leader>c", "<cmd>bdelete<cr>",  { desc = "Delete Buffer" })
    map("n","<leader>C", "<cmd>bdelete<cr>",  { desc = "Force Delete Buffer" })
end
  
-- Navigate buffers
map("n","<leader>bb", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
map("n","<leader>`", "<cmd>e #<cr>",  { desc = "Switch to Other Buffer" })
if has("bufferline.nvim") then
    map("n","<S-l>", "<cmd>BufferLineCycleNext<cr>",  { desc = "Next buffer tab" })
    map("n","<S-h>", "<cmd>BufferLineCyclePrev<cr>",  { desc = "Previous buffer tab" })
    map("n","<b-l>", "<cmd>BufferLineCycleNext<cr>",  { desc = "Next buffer tab" })
    map("n","<b-h>", "<cmd>BufferLineCyclePrev<cr>",  { desc = "Previous buffer tab" })
    map("n",">b", "<cmd>BufferLineMoveNext<cr>",  { desc = "Move buffer tab right" })
    map("n","<b", "<cmd>BufferLineMovePrev<cr>",  { desc = "Move buffer tab left" })
    map("n","b1", "<cmd>BufferLineGoToBuffer 1<cr>",  { desc = "Goto buffer 1" })
    map("n","b2", "<cmd>BufferLineGoToBuffer 2<cr>",  { desc = "Goto buffer 2" })
    map("n","b3", "<cmd>BufferLineGoToBuffer 3<cr>",  { desc = "Goto buffer 3" })
    map("n","b4", "<cmd>BufferLineGoToBuffer 4<cr>",  { desc = "Goto buffer 4" })
    map("n","b5", "<cmd>BufferLineGoToBuffer 5<cr>",  { desc = "Goto buffer 5" })
    map("n","b6", "<cmd>BufferLineGoToBuffer 6<cr>",  { desc = "Goto buffer 6" })
    map("n","b7", "<cmd>BufferLineGoToBuffer 7<cr>",  { desc = "Goto buffer 7" })
    map("n","b8", "<cmd>BufferLineGoToBuffer 8<cr>",  { desc = "Goto buffer 8" })
    map("n","b9", "<cmd>BufferLineGoToBuffer 9<cr>",  { desc = "Goto buffer 9" })
    map("n","bP", "<cmd>BufferLineTogglePin<cr>",  { desc = "Pin/Unpin buffer" })
else
    map("n","<S-l>", "<cmd>bnext<cr>",  { desc = "Next buffer" })
    map("n","<S-h>", "<cmd>bprevious<cr>",  { desc = "Previous buffer" })
    map("n","<b-l>", "<cmd>BufferLineCycleNext<cr>",  { desc = "Next buffer tab" })
    map("n","<b-h>", "<cmd>BufferLineCyclePrev<cr>",  { desc = "Previous buffer tab" })
end

-- Clear search with <esc>
map("n","<esc>", "<cmd>noh<cr><esc>",  { desc = "Escape and clear hlsearch" })
map("i","<esc>", "<cmd>noh<cr><esc>",  { desc = "Escape and clear hlsearch" })

-- Clear search, diff update and redraw
-- taken from runtime/lua/_editor.lua
map("n","<leader>ur", "<Cmd>nohlsearch<Bar>diffupdate<Bar>normal! <C-L><CR>",  { desc = "Redraw / clear hlsearch / diff update" })

map("n", "gw" , "*N" )
map("x","gw", "*N" )

-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
-- map("n","n", "'Nn'[v:searchforward]", { expr = true,  desc = "Next search result" })
map("x","n", "'Nn'[v:searchforward]", { expr = true,  desc = "Next search result" })
map("o","n", "'Nn'[v:searchforward]", { expr = true,  desc = "Next search result" })
-- map("n","n", "'nN'[v:searchforward]", { expr = true,  desc = "Prev search result" })
map("x","N", "'nN'[v:searchforward]", { expr = true,  desc = "Prev search result" })
map("o","N", "'nN'[v:searchforward]", { expr = true,  desc = "Prev search result" })

-- Add undo break-points
map("i",",", ",<c-g>u" )
map("i",".", ".<c-g>u" )
map("i",";", ";<c-g>u" )

-- save file
map({"i", "v", "n", "x"} ,"<C-s>", "<cmd>w<cr><esc>",  { desc = "Save file" })

-- better indenting
map("v", "<", "<gv" )
map("v", ">", ">gv" ) 
-- lazy
map("n","<leader>l", "<cmd>:Lazy<cr>",  { desc = "Lazy" })

-- new file

map("n","<leader>xl", "<cmd>lopen<cr>",  { desc = "Location List" })
map("n","<leader>xq", "<cmd>copen<cr>",  { desc = "Quickfix List" })

-- GitSigns
if has("gitsigns.nvim") then
    map("n","<leader>gj",
      function()
        require("gitsigns").next_hunk()
      end,
      { desc = "Next git hunk",
    })
    map("n","<leader>gk",
      function()
        require("gitsigns").prev_hunk()
      end,
      {desc = "Previous git hunk",
    })
    map("n","<leader>gl",
      function()
        require("gitsigns").blame_line()
      end,
      {desc = "View git blame",
    })
    map("n","<leader>gp",
      function()
        require("gitsigns").preview_hunk()
      end,
      {desc = "Preview git hunk",
    })
    map("n","<leader>gh",
      function()
        require("gitsigns").reset_hunk()
      end,
      {desc = "Reset git hunk",
    })
    map("n","<leader>gr",
      function()
        require("gitsigns").reset_buffer()
      end,
      {desc = "Reset git buffer",
    })
    map("n","<leader>gs",
      function()
        require("gitsigns").stage_hunk()
      end,
      {desc = "Stage git hunk",
    })
    map("n","<leader>gu",
      function()
        require("gitsigns").undo_stage_hunk()
      end,
      {desc = "Unstage git hunk",
    })
    map("n","<leader>gd",
      function()
        require("gitsigns").diffthis()
      end,
      {desc = "View git diff",
    })
end
  
-- NeoTree
if has("neo-tree.nvim") then
    map("n","<leader>e", "<cmd>Neotree toggle<cr>",  { desc = "Toggle Explorer" })
    map("n","<leader>o", "<cmd>Neotree focus<cr>",  { desc = "Focus Explorer" })
end

-- Session Manager
if has("persistence.nvim") then
    map("n","<leader>qs", function() require("persistence").load() end,  { desc = "Restore Session" })
    map("n","<leader>ql",function() require("persistence").load({ last = true }) end,  { desc = "Restore Last Session" })
    map("n","<leader>qd", function() require("persistence").stop() end,  { desc = "Don't Save Current Session" })
end

map("n","<C-h>", "<C-w>h",  { desc = "Move to left split" })
map("n","<C-j>", "<C-w>j",  { desc = "Move to below split" })
map("n","<C-k>", "<C-w>k",  { desc = "Move to above split" })
map("n","<C-l>", "<C-w>l",  { desc = "Move to right split" })
map("n","<C-Up>", "<cmd>resize -2<CR>",  { desc = "Resize split up" })
map("n","<C-Down>", "<cmd>resize +2<CR>",  { desc = "Resize split down" })
map("n","<C-Left>", "<cmd>vertical resize -2<CR>",  { desc = "Resize split left" })
map("n","<C-Right>", "<cmd>vertical resize +2<CR>",  { desc = "Resize split right" })

-- SymbolsOutline
if has("aerial.nvim") then
    map("n","<leader>lS", "<cmd>AerialToggle<cr>",  { desc = "Symbols outline" })
end

-- Terminal
if has("toggleterm.nvim") then
    map("n","<C-\\>", "<cmd>ToggleTerm<cr>",  { desc = "Toggle terminal" })
    map("n","<leader>gg",
      function()
        toggle_term_cmd "lazygit"
      end,
      {desc = "ToggleTerm lazygit",
    })
    map("n","<leader>gG",
        function()
          toggle_term_cmd "glances"
        end,
        {desc = "Glances",
      })
    map("n","<leader>tt",
      function()
        toggle_term_cmd "htop"
      end,
      {desc = "ToggleTerm htop",
    })
    map("n","<leader>tp",
      function()
        toggle_term_cmd "python"
      end,
      {desc = "ToggleTerm python",
    })
    map("n","<leader>tl",
      function()
        toggle_term_cmd "lazygit"
      end,
      {desc = "ToggleTerm lazygit",
    })
    map("n","<leader>tc",
      function()
        toggle_term_cmd("pre-commit run --all-files", false)
      end,
      {desc = "ToggleTerm pre-commit",
    })
    map("n","<leader>tr",
      function()
        toggle_term_cmd("python " .. vim.fn.expand('%:p'), false)
      end,
      {desc="ToogleTerm run python",
    })
    map("n","<leader>tf", "<cmd>ToggleTerm direction=float<cr>",  { desc = "ToggleTerm float" })
    map("n","<leader>th", "<cmd>ToggleTerm size=10 direction=horizontal<cr>",  { desc = "ToggleTerm horizontal split" })
    map("n","<leader>tv", "<cmd>ToggleTerm size=80 direction=vertical<cr>",  { desc = "ToggleTerm vertical split" })
    map("n","<leader>tC", "<cmd>CondaEnvSelect<cr>", { desc = "Select Conda Environment" })
end
  
-- Stay in indent mode
map("v", "<", "<gv",  { desc = "unindent line" })
map("v", ">", ">gv",  { desc = "indent line" })
  
-- Improved Terminal Mappings
map("t", "<esc>", "<C-\\><C-n>",  { desc = "Terminal normal mode" })
map("t", "jk", "<C-\\><C-n>",  { desc = "Terminal normal mode" })
map("t", "<C-h>", "<c-\\><c-n><c-w>h",  { desc = "Terminal left window navigation" })
map("t", "<C-j>", "<c-\\><c-n><c-w>j",  { desc = "Terminal down window navigation" })
map("t", "<C-k>", "<c-\\><c-n><c-w>k",  { desc = "Terminal up window navigation" })
map("t", "<C-l>", "<c-\\><c-n><c-w>l",  { desc = "Terminal right window naviation" })

-- windows
map("n","<leader>ww", "<C-W>p",  { desc = "Other window" })
map("n","<leader>wd", "<C-W>c",  { desc = "Delete window" })
map("n","<leader>w-", "<C-W>s",  { desc = "Split window below" })
map("n","<leader>w|", "<C-W>v",  { desc = "Split window right" })
map("n","<leader>-", "<C-W>s",  { desc = "Split window below" })
map("n","<leader>|", "<C-W>v",  { desc = "Split window right" })

-- tabs
map("n","<leader><tab>l", "<cmd>tablast<cr>",  { desc = "Last Tab" })
map("n","<leader><tab>f", "<cmd>tabfirst<cr>",  { desc = "First Tab" })
map("n","<leader><tab><tab>", "<cmd>tabnew<cr>",  { desc = "New Tab" })
map("n","<leader><tab>]", "<cmd>tabnext<cr>",  { desc = "Next Tab" })
map("n","<leader><tab>d", "<cmd>tabclose<cr>",  { desc = "Close Tab" })
map("n","<leader><tab>[", "<cmd>tabprevious<cr>",  { desc = "Previous Tab" })

if has('todo-comments.nvim') then
    map("n","]t", function() require("todo-comments").jump_next() end,  { desc = "Next todo comment" })
    map("n","[t", function() require("todo-comments").jump_prev() end,  { desc = "Previous todo comment" })
    map("n","<leader>xt", "<cmd>TodoTrouble<cr>",  { desc = "Todo (Trouble)" })
    map("n","<leader>xT", "<cmd>TodoTrouble keywords=TODO,FIX,FIXME<cr>",  { desc = "Todo/Fix/Fixme (Trouble)" })
    map("n","<leader>st", "<cmd>TodoTelescope<cr>",  { desc = "Todo" })
end

if has("nvim-dap") then
    map("n","ds", "<cmd>DapStepOver<cr>",  { desc = "Step Over" })
    map("n","di", "<cmd>DapStepInto<cr>",  { desc = "Step Into" })
    map("n","do", "<cmd>DapStepOut<cr>",  { desc = "Step Out" })
    map("n","db", "<cmd>DapToggleBreakpoint<cr>",  { desc = "Toggle Breakpoint" })
    map("n","dt", "<cmd>DapTerminate<cr>",  { desc = "Terminate" })
    map("n","dr", "<cmd>DapToggleRepl<cr>",  { desc = "Toggle REPL" })
    map("n","dB", "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>",  { desc = "Toggle Conditional Breakpoint" })
    map("n","du", "<cmd>lua require('dapui').toggle()<cr>" ,  { desc = "Toggle UI" })
    map("n","dL", "<cmd>lua require'telescope'.extensions.dap.list_breakpoints{}<cr>",  { desc = "List breakpoints" })
    map("n","dC", "<cmd>lua require'telescope'.extensions.dap.commands{}<cr>",  { desc = "List commands" })
    map("n","dv", "<cmd>lua require'telescope'.extensions.dap.variables{}<cr>",  { desc = "List variables" })
    map("n","df", "<cmd>lua require'telescope'.extensions.dap.frames{}<cr>",  { desc = "List frames" })
end

if has("neotest") then
    -- vim.api.nvim_echo("DAPLoaded", false, {})
    map("n",'nn', "<cmd>lua require('neotest').run.run()<cr>",  { desc = "Run Nearest Test" })
    map("n",'nd', "<cmd>lua require('neotest').run.run({ strategy = 'dap' })<cr>",  { desc = "Debug Nearest Test" })
    map("n",'nr', "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<cr>",  { desc = "Run Current Test File" })
    map("n",'ns', "<cmd>lua require('neotest').run.run({ suite = true })<cr>",  { desc = "Run Current Test Suite" })
    map("n",'nl', "<cmd>lua require('neotest').run.run_last()<cr>",  { desc = "Run Last Test" })
    map("n",'nD', "<cmd>lua require('neotest').run.run_last({ strategy = 'dap' })<cr>",  { desc = "Debug Last Test" })
    map("n",'na', "<cmd>lua require('neotest').run.attach()<cr>",  { desc = "Attach to Running Process" })
    map("n",'no', "<cmd>lua require('neotest').output.open({ enter = true })<cr>",  { desc = "Outputs" })
    map("n",'nO', "<cmd>lua require('neotest').output.open({ enter = true, short = true })<cr>",  { desc = "Short Outputs" })
    map("n",'nk', "<cmd>lua require('neotest').run.stop()<cr>",  { desc = "Kill Current Test Run" })
end

-- function set_mappings(map_table, base)
--     for mode, maps in pairs(map_table) do
--         for keymap, options in pairs(maps) do
--             if options then
--                 local cmd = options
--                 if type(options) == "table" then
--                     cmd = options[1]
--                     options[1] = nil
--                 else
--                     options = {}
--                 end
--                 vim.keymap.set(mode, keymap, cmd, vim.tbl_deep_extend("force", options, base or {}))
--             end
--         end
--     end
-- end

-- set_mappings(maps)

local extra_sections = {
    g = "Git",
    s = "Search",
    q = "Session",
    t = "Terminal",
    n = "Neotest",
    d = "Debugging",
    w = "Windows",
    u = "Toggles"
}

local mappings = {
  n = {
    ["<leader>"] = {
    },
  },
}

local function init_table(mode, prefix, idx)
  if not mappings[mode][prefix][idx] then
    mappings[mode][prefix][idx] = { name = extra_sections[idx] }
  end
end

init_table("n", "<leader>", "g")
init_table("n", "<leader>", "s")
init_table("n", "<leader>", "q")
init_table("n", "<leader>", "t")
init_table("n", "<leader>", "n")
init_table("n", "<leader>", "d")
init_table("n", "<leader>", "w")
init_table("n", "<leader>", "u")

local which_key = require('which-key')
for mode, prefixes in pairs(mappings) do
    for prefix, mapping_table in pairs(prefixes) do
      which_key.register(mapping_table, {
        mode = mode,
        prefix = prefix,
        buffer = nil,
        silent = true,
        noremap = true,
        nowait = true,
      })
    end
end
-- which_key.setup({
--     plugins = {
--       spelling = { enabled = true },
--       presets = { operators = false },
--     },
--     window = {
--       border = "rounded",
--       padding = { 2, 2, 2, 2 },
--     },
--   })