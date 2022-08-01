local config = {



 
  -- Configure plugins
  plugins = {
      
  -- Modify which-key registration
  ["which-key"] = {
    -- Add bindings
    register_mappings = {
      -- first key is the mode, n == normal mode
      n = {
        -- second key is the prefix, <leader> prefixes
        ["<leader>"] = {
          ["b"] = {
            name = 'Buffer',
            ["c"] = { "<cmd>BufferClose<cr>", "Close  Buffer"},
            ["q"] = { "<cmd>BufferCloseAllButCurrent<cr>", "Close all buffers except current" } ,
            ["n"] = { "<cmd>BufferNext<cr>", "Next buffer" } ,
            ["p"] = { "<cmd>BufferPrevious<cr>", "Previous buffer" } ,
            ["1"] = { "<cmd>BufferGoto 1<cr>", "Goto buffer 1" } ,
            ["2"] = { "<cmd>BufferGoto 2<cr>", "Goto buffer 2" } ,
            ["3"] = { "<cmd>BufferGoto 3<cr>", "Goto buffer 3" } ,
            ["4"] = { "<cmd>BufferGoto 4<cr>", "Goto buffer 4" } ,
            ["5"] = { "<cmd>BufferGoto 5<cr>", "Goto buffer 5" } ,
            ["6"] = { "<cmd>BufferGoto 6<cr>", "Goto buffer 6" } ,
            ["7"] = { "<cmd>BufferGoto 7<cr>", "Goto buffer 7" } ,
            ["8"] = { "<cmd>BufferGoto 8<cr>", "Goto buffer 8" } ,
            ["9"] = { "<cmd>BufferGoto 9<cr>", "Goto buffer 9" } ,
            ["P"] = { "<cmd>BufferPinUnpin<cr>", "Pin/Unpin buffer" } ,
            ["s"] = { "<cmd>BufferOrderByBufferNumber<cr>", "Order buffers by buffer number" } ,
          },
          ["l"] = {
             ["p"] = { "<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>", "Previous LSP error" },
             ["n"] = { "<cmd>lua vim.lsp.diagnostic.goto_next()<cr>", "Next LSP error" },
             ["a"] = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
             ["d"] = { "<cmd>lua vim.lsp.buf.definition()<cr>", "Show Definition" }, 
             ["f"] = { "<cmd>lua vim.lsp.buf.formatting()<cr>", "Formatting" },
             ["h"] = { "<cmd>lua vim.lsp.buf.hover()<cr>", "Hover" },
             ["r"] = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
             ["u"] = { "<cmd>lua vim.lsp.buf.references()<cr>", "Usage" },
          },
          ["T"] = {
            name = 'Telescope',
            ["r"] = { "<cmd>lua require('telescope.builtin').live_grep()<cr>", "Find word" },
            ["s"] = { "<cmd>lua require('telescope.builtin').grep_string()<cr>", "Find word" },
            ["bb"] = { "<cmd>lua require('telescope.builtin').buffers()<cr>", "Buffers" },
            ["h"] = { "<cmd>lua require('harpoon.mark').add_file()<cr>", "Add File Harpoon" },
            ["m"] = { "<cmd>Telescope harpoon marks<cr>", "Harpoon Marks" },
            ["mm"] = {"<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", "Harpoon Quick Menu" },
            ["t"] = { "<cmd>lua require('telescope.builtin').treesitter()<cr>", "Treesitter" },
            ["l"] = { "<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>", "Fuzzy Find" },
            ["f"] = { "<cmd>lua require('telescope.builtin').find_files()<cr>", "Find Files" },
          },
          ["d"] = {
            name = "Debug",
            ["c"] = { "<cmd>DapContinue<cr>", "Continue" },
            ["s"] = { "<cmd>DapStepOver<cr>", "Step Over" },
            ["i"] = { "<cmd>DapStepInto<cr>", "Step Into" },
            ["o"] = { "<cmd>DapStepOut<cr>", "Step Out" },
            ["b"] = { "<cmd>DapToggleBreakpoint<cr>", "Toggle Breakpoint" },
            ["t"] = { "<cmd>DapTerminate<cr>",  "Terminate" },
            ["r"] = { "<cmd>DapToggleRepl<cr>", "Toggle REPL" },
            ["B"] = { "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>", "Toggle Conditional Breakpoint"},
            ["u"] = { "<cmd>lua require('dapui').toggle()<cr>" , "Toggle UI" },
            ["L"] = { "<cmd>lua require'telescope'.extensions.dap.list_breakpoints{}<cr>", "List breakpoints" },
            ["C"] = { "<cmd>lua require'telescope'.extensions.dap.commands{}<cr>", "List commands" },
            ["v"] = { "<cmd>lua require'telescope'.extensions.dap.variables{}<cr>", "List variables" },
            ["f"] = { "<cmd>lua require'telescope'.extensions.dap.frames{}<cr>", "List frames" },
          },
          ["n"] = {
            name = "Neotest",
            ['n'] = { "<cmd>lua require('neotest').run.run()<cr>", "Run Nearest Test"},
            ['d'] = { "<cmd>lua require('neotest').run.run({ strategy = 'dap' })", "Debug Nearest Test"},
            ['r'] = { "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<cr>", "Run Current Test File"},
            ['s'] = { "<cmd>lua require('neotest').run.run({ suite = true })<cr>", "Run Current Test Suite"},
            ['l'] = { "<cmd>lua require('neotest').run.run_last()<cr>", "Run Last Test"},
            ['D'] = { "<cmd>lua require('neotest').run.run_last({ strategy = 'dap' })<cr>", "Debug Last Test"},
            ['a'] = { "<cmd>lua require('neotest').run.attach()<cr>", "Attach to Running Process"},
            ['o'] = { "<cmd>lua require('neotest').output.toggle({ enter = true })<cr>", "Outputs"},
            ['O'] = { "<cmd>lua require('neotest').output.toggle({ enter = true, short = true })<cr>", "Short Outputs"},
            ['S'] = { "<cmd>lua require('neotest').summary.toggle()<cr>", "Summary"},
            ['r'] = { "<cmd>lua require('neotest').status.toggle()<cr>", "Results"},
            ['R'] = { "<cmd>lua require('neotest').diagnostics.toggle()<cr>", "Diagnostics"},
          },
        },
      },
    },
  },


  -- This function is run last
  -- good place to configuring augroups/autocommands and custom filetypes
  polish = function()
    -- Set key binding
    -- Set autocommands
    vim.api.nvim_create_augroup("packer_conf", { clear = true })
    vim.api.nvim_create_autocmd("BufWritePost", {
      desc = "Sync packer after modifying plugins.lua",
      group = "packer_conf",
      pattern = "plugins.lua",
      command = "source <afile> | PackerSync",
    })
    vim.api.nvim_create_autocmd("TextYankPost", {
      callback =  function()
        vim.highlight.on_yank()
      end,
    })
    -- remove whitespace on save
    vim.cmd [[au BufWritePre * :%s/\s\+$//e]]


    -- highlight on yank
    vim.api.nvim_exec([[
    augroup YankHighlight
      autocmd!
      autocmd TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=700}
    augroup end
    ]], false)
    vim.cmd [[au BufNewFile,BufRead *.py set foldmethod=indent]]

    -- Set up custom filetypes
    -- vim.filetype.add {
    --   extension = {
    --     foo = "fooscript",
    --   },
    --   filename = {
    --     ["Foofile"] = "fooscript",
    --   },
    --   pattern = {
    --     ["~/%.config/foo/.*"] = "fooscript",
    --   },
    -- }
  end,
}

return config
