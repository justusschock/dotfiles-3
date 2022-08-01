local status_ok, which_key = pcall(require, "which-key")
if status_ok then
  local is_available = astronvim.is_available
  local user_plugin_opts = astronvim.user_plugin_opts
  local mappings = {
    n = {
      ["<leader>"] = {
        f = { name = "File" },
        p = { name = "Packer" },
        l = { name = "LSP" },
      },
    },
  }

  local extra_sections = {
    g = "Git",
    s = "Search",
    S = "Session",
    t = "Terminal",
  }

  local function init_table(mode, prefix, idx)
    if not mappings[mode][prefix][idx] then
      mappings[mode][prefix][idx] = { name = extra_sections[idx] }
    end
  end

  if is_available "neovim-session-manager" then
    init_table("n", "<leader>", "S")
  end

  if is_available "gitsigns.nvim" then
    init_table("n", "<leader>", "g")
  end

  if is_available "toggleterm.nvim" then
    init_table("n", "<leader>", "g")
    init_table("n", "<leader>", "t")
  end

  if is_available "telescope.nvim" then
    init_table("n", "<leader>", "s")
    init_table("n", "<leader>", "g")
  end

  mappings = user_plugin_opts("which-key.register_mappings", mappings)
  -- support previous legacy notation, deprecate at some point
  mappings.n["<leader>"] = user_plugin_opts("which-key.register_n_leader", mappings.n["<leader>"])
  user_mappings = {
      -- first key is the mode, n == normal mode
      n = {
        -- second key is the prefix, <leader> prefixes
        ["<leader>"] = {
          ["b"] = {
            name = 'Buffer',
            ["n"] = { "<cmd>BufferLineMoveNext<cr>", "Next buffer" } ,
            ["p"] = { "<cmd>BufferLineMovePrev<cr>", "Previous buffer" } ,
            ["1"] = { "<cmd>BufferLineGoToBuffer 1<cr>", "Goto buffer 1" } ,
            ["2"] = { "<cmd>BufferLineGoToBuffer 2<cr>", "Goto buffer 2" } ,
            ["3"] = { "<cmd>BufferLineGoToBuffer 3<cr>", "Goto buffer 3" } ,
            ["4"] = { "<cmd>BufferLineGoToBuffer 4<cr>", "Goto buffer 4" } ,
            ["5"] = { "<cmd>BufferLineGoToBuffer 5<cr>", "Goto buffer 5" } ,
            ["6"] = { "<cmd>BufferLineGoToBuffer 6<cr>", "Goto buffer 6" } ,
            ["7"] = { "<cmd>BufferLineGoToBuffer 7<cr>", "Goto buffer 7" } ,
            ["8"] = { "<cmd>BufferLineGoToBuffer 8<cr>", "Goto buffer 8" } ,
            ["9"] = { "<cmd>BufferLineGoToBuffer 9<cr>", "Goto buffer 9" } ,
            ["P"] = { "<cmd>BufferLineTogglePin<cr>", "Pin/Unpin buffer" } ,
            ["s"] = { "<cmd>BufferLineSortByDirectory<cr>", "Order buffers by buffer directory" } ,
            ["e"] = { "<cmd>BufferLineSortByExtension<cr>", "Order buffers by file extension" } ,
            ["r"] = { "<cmd>BufferLineSortByRelativeDirectory<cr>", "Order buffers by file relative directory" },
            ["t"] = { "<cmd>BufferLineSortByTabs<cr>", "Order buffers by tabs" }, 
          },
          -- ["l"] = {
          --    ["p"] = { "<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>", "Previous LSP error" },
          --    ["n"] = { "<cmd>lua vim.lsp.diagnostic.goto_next()<cr>", "Next LSP error" },
          --    ["a"] = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
          --    ["d"] = { "<cmd>lua vim.lsp.buf.definition()<cr>", "Show Definition" }, 
          --    ["f"] = { "<cmd>lua vim.lsp.buf.formatting()<cr>", "Formatting" },
          --    ["h"] = { "<cmd>lua vim.lsp.buf.hover()<cr>", "Hover" },
          --    ["r"] = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
          --    ["u"] = { "<cmd>lua vim.lsp.buf.references()<cr>", "Usage" },
          -- },
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
            ['d'] = { "<cmd>lua require('neotest').run.run({ strategy = 'dap' })<cr>", "Debug Nearest Test"},
            ['r'] = { "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<cr>", "Run Current Test File"},
            ['s'] = { "<cmd>lua require('neotest').run.run({ suite = true })<cr>", "Run Current Test Suite"},
            ['l'] = { "<cmd>lua require('neotest').run.run_last()<cr>", "Run Last Test"},
            ['D'] = { "<cmd>lua require('neotest').run.run_last({ strategy = 'dap' })<cr>", "Debug Last Test"},
            ['a'] = { "<cmd>lua require('neotest').run.attach()<cr>", "Attach to Running Process"},
            ['o'] = { "<cmd>lua require('neotest').output.open({ enter = true })<cr>", "Outputs"},
            ['O'] = { "<cmd>lua require('neotest').output.open({ enter = true, short = true })<cr>", "Short Outputs"},
            ['k'] = { "<cmd>lua require('neotest').run.stop()<cr>"}
          },
          -- ["t"] = {
          --  ['c'] = { "<cmd>CondaEnvSelect<cr>", "Select Conda Environment" }
          -- },
      },
    },
  }
  

  table_merge = function(first_table, second_table)
    for k, v in pairs(second_table) do
      if (first_table[k] ~= nil) then
        if (type(v) == 'table') then
          if type(first_table[k] == 'table') then
            first_table[k] = table_merge(first_table[k], v)
          else
            first_table[k] = v
          end
        else
          first_table[k] = v
        end
      else
        first_table[k] = v
      end
    end
    return first_table
  end

  merged_mappings = table_merge(mappings, user_mappings)
  for mode, prefixes in pairs(merged_mappings) do
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
end
