-- <F1> help
-- <F2> vim-codepainter
-- <F3> vim-codepainter navigate
local wk = require('which-key')

local M = {}

function M.setup()

  vim.api.nvim_set_keymap('i', '<Tab>', 'copilot#Accept()', {noremap = true, silent = true, expr = true})
  vim.g.mapleader = " "



  local whichkey = require "which-key"

  local conf = {
    window = {
      border = "single", -- none, single, double, shadow
      position = "bottom", -- bottom, top
    },
  }

  local opts = {
    mode = "n", -- Normal mode
    prefix = "<leader>",
    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = false, -- use `nowait` when creating keymaps
  }

  local mappings = {
    b = {
      name = 'Buffer',
      c = { "<cmd>BufferClose<cr>", "Close  Buffer"},
      q = { "<cmd>BufferCloseAllButCurrent<cr>", "Close all buffers except current" } ,
      n = { "<cmd>BufferNext<cr>", "Next buffer" } ,
      p = { "<cmd>BufferPrevious<cr>", "Previous buffer" } ,
      ["1"] = { "<cmd>BufferGoto 1<cr>", "Goto buffer 1" } ,
      ["2"] = { "<cmd>BufferGoto 2<cr>", "Goto buffer 2" } ,
      ["3"] = { "<cmd>BufferGoto 3<cr>", "Goto buffer 3" } ,
      ["4"] = { "<cmd>BufferGoto 4<cr>", "Goto buffer 4" } ,
      ["5"] = { "<cmd>BufferGoto 5<cr>", "Goto buffer 5" } ,
      ["6"] = { "<cmd>BufferGoto 6<cr>", "Goto buffer 6" } ,
      ["7"] = { "<cmd>BufferGoto 7<cr>", "Goto buffer 7" } ,
      ["8"] = { "<cmd>BufferGoto 8<cr>", "Goto buffer 8" } ,
      ["9"] = { "<cmd>BufferGoto 9<cr>", "Goto buffer 9" } ,
      P = { "<cmd>BufferPinUnpin<cr>", "Pin/Unpin buffer" } ,
      s = { "<cmd>BufferOrderByBufferNumber<cr>", "Order buffers by buffer number" } ,

    },
    g = {
      name = 'Git',
      f = { "<cmd>20G<cr>"},
      l = { "<cmd>LazyGit<cr>", "Lazy Git"},
      c = { "<cmd>Git commit<cr>", "Commit"},
      p = { "<cmd>Git push<cr>", "Push"},
      u = { "<cmd>Git pull<cr>", "Pull"},
      },
    l = {
      name = 'LSP',
      p = { "<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>", "Previous LSP error" },
      n = { "<cmd>lua vim.lsp.diagnostic.goto_next()<cr>", "Next LSP error" },
      a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
      d = { "<cmd>lua vim.lsp.buf.definition()<cr>", "Show Definition" }, 
      f = { "<cmd>lua vim.lsp.buf.formatting()<cr>", "Formatting" },
      h = { "<cmd>lua vim.lsp.buf.hover()<cr>", "Hover" },
      r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
      u = { "<cmd>lua vim.lsp.buf.references()<cr>", "Usage" },
      s = { "<cmd>lua vim.lsp.buf.document_symbol()<cr>", "Document Symbol" },
    },
    e = {
      name = "EasyAlign",
      a = { "Plug>(EasyAlign)", "Easy Align" },
    },
    T = {
      name = 'Telescope',
      r = { "<cmd>lua require('telescope.builtin').live_grep()<cr>", "Find word" },
      s = { "<cmd>lua require('telescope.builtin').grep_string()<cr>", "Find word" },
      bb = { "<cmd>lua require('telescope.builtin').buffers()<cr>", "Buffers" },
      h = { "<cmd>lua require('harpoon.mark').add_file()<cr>", "Add File Harpoon" },
      m = { "<cmd>Telescope harpoon marks<cr>", "Harpoon Marks" },
      mm = {"<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", "Harpoon Quick Menu" },
      t = { "<cmd>lua require('telescope.builtin').treesitter()<cr>", "Treesitter" },
      l = { "<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>", "Fuzzy Find" },
      f = { "<cmd>lua require('plugins.telescope').project_files()<cr>", "Project Files" },
      p = {"<cmd>lua require('telescope').extensions.project.project{},cr>", "Project" },
      c = { "<cmd>lua require('plugins.telescope').my_git_commits()<cr>", "My Git Commits" },
      g = { "<cmd>lua require('plugins.telescope').my_git_status()<cr>", "My Git Status" },
      n = { "<cmd>luad require('plugins.telescope').my_note()<cr>", "My Note" },
      to = { "<cmd>TodoTelescope<cr>", "My Todo" },
    }, 
    t = {
      name = "Terminal",
      t = { "<cmd>ToggleTerm<cr>", "Toggle Terminal" },
      l = { "<cmd>ToggleLazyGitTerm<cr>", "Toggle Lazy Git" },
      s = { "<cmd>ToggleTermSendCurrentLine<cr>", "Send Current Line" },
      v = { "<cmd>ToggleTermSendVisualSelection<cr>", "Send Visual Selection" },
      c = { "<cmd>CondaEnvSelect<cr>", "Select Conda Env" },

    },
    x = {
      name = "Trouble",
      x = { "<cmd>Trouble<cr>", "Trouble" },
      w = { "<cmd>Trouble workspace_diagnostics<cr>", "Workspace Diagnostics" },
      d = { "<cmd>Trouble document_diagnostics<cr>", "Document Diagnostics" },
      l = { "<cmd>Trouble loclist<cr>" , "Loclist" },
      q = { "<cmd>Trouble quickfix<cr>", "Quickfix" },
      r = { "<cmd>Trouble lsp_references<cr>" , "LSP References" },
    },
    d = {
      name = "Debug",
      c = { "<cmd>DapContinue<cr>", "Continue" },
      s = { "<cmd>DapStepOver<cr>", "Step Over" },
      i = { "<cmd>DapStepInto<cr>", "Step Into" },
      o = { "<cmd>DapStepOut<cr>", "Step Out" },
      b = { "<cmd>DapToggleBreakpoint<cr>", "Toggle Breakpoint" },
      t = { "<cmd>DapTerminate<cr>",  "Terminate" },
      r = { "<cmd>DapToggleRepl<cr>", "Toggle REPL" },
      B = { "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>", "Toggle Conditional Breakpoint"},
      u = { "<cmd>lua require('dapui').toggle()<cr>" , "Toggle UI" },
      L = { "<cmd>lua require'telescope'.extensions.dap.list_breakpoints{}<cr>", "List breakpoints" },
      C = { "<cmd>lua require'telescope'.extensions.dap.commands{}<cr>", "List commands" },
      v = { "<cmd>lua require'telescope'.extensions.dap.variables{}<cr>", "List variables" },
      f = { "<cmd>lua require'telescope'.extensions.dap.frames{}<cr>", "List frames" },

    },
    u = {
      name = 'Ultest',
      r = { "<cmd>Ultest<cr>", "Run Tests in Current File" },
      n = { "<cmd>UltestNearest<cr>", "Run Nearest Tests in File" },
      l = { "<cmd>UltestLast<cr>", "Run Tests that were run last time" },
      d = { "<cmd>UltestDebug<cr>", "Run Tests in Current File with Debug" },
      D = { "<cmd>UltestDebugNearest<cr>", "Run Nearest Tests in File with Debug" },
      o = { "<cmd>UltestOutput<cr>", "Show the output of the nearest position in the current file" },
      a = { "<cmd>UltestAttach<cr>", "  Attach to the running process of a position to be able to send input and read output as it runs. This is useful for debugging" },
      q = { "<cmd>UltestStop<cr>", "Stop the running tests" },
      Q = { "<cmd>UltestStopNearest<cr>", "Stop nearest running tests" },
      s = { "<cmd>UltestSummary!<cr>", "Show the summary of the tests and jump to opened window." },
      S = { "<cmd>UltestSummary<cr>", "Show the summary of the tests" },
      c = { "<cmd>UltestClear<cr>", "Clear the results from the current file" },
    },
    m = {
      name = 'Miscellaneous',
      t = { "<cmd>NvimTreeToggle<cr>", "Toggle NvimTree" },
      m = { "<cmd>MinimapToggle<cr>", "Toggle MiniMap" },
    }
  }

  whichkey.setup(conf)
  whichkey.register(mappings, opts)
end

return M

-- vim.api.nvim_set_keymap('n', '<F7>', ':NvimTreeToggle<CR>', {noremap = false, silent = true})
-- vim.api.nvim_set_keymap('n', '<F8>', ':MinimapToggle<CR>', {noremap = false, silent = true})

-- -- Move.nvim
-- vim.api.nvim_set_keymap('n', '<A-j>', ":MoveLine(1)<CR>", { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<A-k>', ":MoveLine(-1)<CR>", { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('v', '<A-j>', ":MoveBlock(1)<CR>", { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('v', '<A-k>', ":MoveBlock(-1)<CR>", { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<A-l>', ":MoveHChar(1)<CR>", { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<A-h>', ":MoveHChar(-1)<CR>", { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('v', '<A-l>', ":MoveHBlock(1)<CR>", { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('v', '<A-h>', ":MoveHBlock(-1)<CR>", { noremap = true, silent = true })
-- -- Trouble
-- vim.api.nvim_set_keymap("n", "<leader>xx", "<cmd>Trouble<cr>", {silent = true, noremap = true})
-- vim.api.nvim_set_keymap("n", "<leader>xw", "<cmd>Trouble workspace_diagnostics<cr>", {silent = true, noremap = true})
-- vim.api.nvim_set_keymap("n", "<leader>xd", "<cmd>Trouble document_diagnostics<cr>", {silent = true, noremap = true})
-- vim.api.nvim_set_keymap("n", "<leader>xl", "<cmd>Trouble loclist<cr>", {silent = true, noremap = true})
-- vim.api.nvim_set_keymap("n", "<leader>xq", "<cmd>Trouble quickfix<cr>", {silent = true, noremap = true})
-- vim.api.nvim_set_keymap("n", "gR", "<cmd>Trouble lsp_references<cr>", {silent = true, noremap = true})
-- -- Nvim-dap
-- vim.api.nvim_set_keymap("n", "<leader>dc", "<cmd>lua require'dap'.continue()<CR>", {silent = true, noremap = true})
-- vim.api.nvim_set_keymap("n", "<leader>ds", "<cmd>lua require'dap'.step_over()<CR>", {silent = true, noremap = true})
-- vim.api.nvim_set_keymap("n", "<leader>dsi", "<cmd>lua require'dap'.step_into()<CR>", {silent = true, noremap = true})
-- vim.api.nvim_set_keymap("n", "<leader>dso", "<cmd>lua require'dap'.step_out()<CR>", {silent = true, noremap = true})
-- vim.api.nvim_set_keymap("n", "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<CR>", {silent = true, noremap = true})
-- vim.api.nvim_set_keymap("n", "<leader>dui", ":lua require('dapui').toggle()<cr>", {silent = true, noremap = true})
-- vim.api.nvim_set_keymap("n", "<leader>dro", "<cmd>lua require'dap'.repl.open()<CR>", {silent = true, noremap = true})
-- vim.api.nvim_set_keymap("n", "<leader>dcc", "<cmd>lua require'telescope'.extensions.dap.commands{}<CR>", {silent = true, noremap = true})
-- vim.api.nvim_set_keymap("n", "<leader>dlb", "<cmd>lua require'telescope'.extensions.dap.list_breakpoints{}<CR>", {silent = true, noremap = true})
-- vim.api.nvim_set_keymap("n", "<leader>dv", "<cmd>lua require'telescope'.extensions.dap.variables{}<CR>", {silent = true, noremap = true})
-- vim.api.nvim_set_keymap("n", "<leader>df", "<cmd>lua require'telescope'.extensions.dap.frames{}<CR>", {silent = true, noremap = true})
