return {
  {
    "akinsho/toggleterm.nvim",
    config = function()
      require("toggleterm").setup({
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
          vim.api.nvim_buf_set_keymap(
            term.bufnr,
            "t",
            "<C-t>",
            "<cmd>ToggleTerm<CR>",
            { noremap = true, silent = true }
          ) -- Adds toggle term command keymap to current buffer
          vim.api.nvim_buf_set_keymap(term.bufnr, "t", "<C-n>", "<C-\\><C-n>", { noremap = true, silent = true }) -- Adds keymap to current buffer to get back to normal mode easier
        end,
      })
      local Terminal = require("toggleterm.terminal").Terminal
      local lazygit = Terminal:new({
        cmd = "lazygit",
        hidden = true,
        on_open = function(term)
          vim.cmd("startinsert!")
          vim.api.nvim_buf_set_keymap(term.bufnr, "t", "<C-t>", "<Cmd>LazyGit<CR>", { noremap = true, silent = true }) -- Adds toggle term command keymap to current buffer
        end,
      })
      local lazydocker = Terminal:new({
        cmd = "lazydocker",
        hidden = true,
        on_open = function(term)
          vim.cmd("startinsert!")
          vim.api.nvim_buf_set_keymap(
            term.bufnr,
            "t",
            "<C-t>",
            "<Cmd>LazyDocker<CR>",
            { noremap = true, silent = true }
          ) -- Adds toggle term command keymap to current buffer
        end,
      })

      local python = Terminal:new({
        cmd = "python",
        hidden = true,
        on_open = function(term)
          vim.cmd("startinsert!")
          vim.api.nvim_buf_set_keymap(
            term.bufnr,
            "t",
            "<C-t>",
            "<Cmd>PythonREPL<CR>",
            { noremap = true, silent = true }
          ) -- Adds toggle term command keymap to current buffer
        end,
      })

      function _LAZYGIT_TOGGLE()
        lazygit:toggle()
      end

      function _PYTHON_TOGGLE()
        python:toggle()
      end

      function _LAZYDOCKER_TOGGLE()
        lazydocker:toggle()
      end

      vim.api.nvim_create_user_command("LazyGit", _LAZYGIT_TOGGLE, { bang = true })
      vim.api.nvim_create_user_command("PythonREPL", _PYTHON_TOGGLE, { bang = true })
      vim.api.nvim_create_user_command("LazyDocker", _LAZYDOCKER_TOGGLE, { bang = true })
    end,
  },
}
