local astro_plugins = {
  -- Plugin manager
  ["wbthomason/packer.nvim"] = {},

  -- Optimiser
  ["lewis6991/impatient.nvim"] = {},

  -- Lua functions
  ["nvim-lua/plenary.nvim"] = { module = "plenary" },

  -- Popup API
  ["nvim-lua/popup.nvim"] = {},

  -- Indent detection
  ["Darazaki/indent-o-matic"] = {
    event = "BufReadPost",
    config = function()
      require "configs.indent-o-matic"
    end,
  },

  -- Notification Enhancer
  ["rcarriga/nvim-notify"] = {
    event = "VimEnter",
    config = function()
      require "configs.notify"
    end,
  },

  -- Neovim UI Enhancer
  ["MunifTanjim/nui.nvim"] = { module = "nui" },

  -- Cursorhold fix
  ["antoinemadec/FixCursorHold.nvim"] = {
    event = { "BufRead", "BufNewFile" },
    config = function()
      vim.g.cursorhold_updatetime = 100
    end,
  },

  -- Smarter Splits
  ["mrjones2014/smart-splits.nvim"] = {
    module = "smart-splits",
    config = function()
      require "configs.smart-splits"
    end,
  },

  -- Icons
  ["kyazdani42/nvim-web-devicons"] = {
    event = "VimEnter",
    config = function()
      require "configs.icons"
    end,
  },

  -- Bufferline
  ["akinsho/bufferline.nvim"] = {
    after = "nvim-web-devicons",
    config = function()
      require "configs.bufferline"
    end,
  },

  -- Better buffer closing
  ["famiu/bufdelete.nvim"] = { cmd = { "Bdelete", "Bwipeout" } },

  -- File explorer
  ["nvim-neo-tree/neo-tree.nvim"] = {
    branch = "v2.x",
    module = "neo-tree",
    cmd = "Neotree",
    requires = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
    setup = function()
      vim.g.neo_tree_remove_legacy_commands = true
    end,
    config = function()
      require "configs.neo-tree"
    end,
  },

  -- Statusline
  ["feline-nvim/feline.nvim"] = {
    after = "nvim-web-devicons",
    config = function()
      require "configs.feline"
    end,
  },

  -- Parenthesis highlighting
  ["p00f/nvim-ts-rainbow"] = { after = "nvim-treesitter" },

  -- Autoclose tags
  ["windwp/nvim-ts-autotag"] = { after = "nvim-treesitter" },

  -- Context based commenting
  ["JoosepAlviste/nvim-ts-context-commentstring"] = { after = "nvim-treesitter" },

  -- Syntax highlighting
  ["nvim-treesitter/nvim-treesitter"] = {
    run = ":TSUpdate",
    event = { "BufRead", "BufNewFile" },
    cmd = {
      "TSInstall",
      "TSInstallInfo",
      "TSInstallSync",
      "TSUninstall",
      "TSUpdate",
      "TSUpdateSync",
      "TSDisableAll",
      "TSEnableAll",
    },
    config = function()
      require "configs.treesitter"
    end,
  },

  -- Snippet engine 
  -- ['dcampos/nvim-snippy'] = {
  --   config = function()
  --     require('snippy').setup({
  --       mappings = {
  --         is = {
  --           ['<C-Tab>'] = 'expand_or_advance',
  --           ['<S-Tab>'] = 'previous',
  --         },
  --         nx = {
  --           ['<leader>x'] = 'cut_text',
  --         },
  --       },
  --     })
  --   end,
  -- },


  -- Snippet engine
  ["L3MON4D3/LuaSnip"] = {
    module = "luasnip",
    wants = "friendly-snippets",
    config = function()
      require "configs.luasnip"
    end,
  },

  -- Completion engine
  ["hrsh7th/nvim-cmp"] = {
    event = "InsertEnter",
    config = function()
      require "configs.cmp"
    end,
    enabled = function ()
      return vim.api.nvim_buf_get_option(0, "buftype") ~= "prompt"
        or require("cmp_dap").is_dap_buffer()
    end,
  },

  -- Snippet completion source
  -- ["dcampos/cmp-snippy"] = {
  --   after = "nvim-cmp",
  --   config = function()
  --     astronvim.add_user_cmp_source "snippy"
  --   end,
  -- },

  -- Snippet collections
  -- ['honza/vim-snippets'] = {},
  -- ["rafamadriz/friendly-snippets"] = { opt = true },


  -- Copilot Server
  ['zbirenbaum/copilot.lua'] = {
    event = {"VimEnter"},
    config = function()
      vim.defer_fn(function()
        require("copilot").setup()
      end, 100)
    end,
  },

  -- Copilot suggestions for cmp
  ['zbirenbaum/copilot-cmp'] = {
    module="copilot_cmp",
    after = "nvim-cmp",
    config = function()
      astronvim.add_user_cmp_source('copilot')
    end,
  },

  -- Buffer completion source
  ["hrsh7th/cmp-buffer"] = {
    after = "nvim-cmp",
    config = function()
      astronvim.add_user_cmp_source "buffer"
    end,
  },

  -- Path completion source
  ["hrsh7th/cmp-path"] = {
    after = "nvim-cmp",
    config = function()
      astronvim.add_user_cmp_source "path"
    end,
  },

  -- LSP completion source
  ["hrsh7th/cmp-nvim-lsp"] = {
    after = "nvim-cmp",
    config = function()
      astronvim.add_user_cmp_source "nvim_lsp"
    end,
  },

  -- DAP completion source
  ['rcarriga/cmp-dap'] = {
    after = 'nvim-cmp',
    config = function()
      astronvim.add_user_cmp_source 'dap'
    end,
  },

  -- Built-in LSP
  ["neovim/nvim-lspconfig"] = { event = "VimEnter" },

  -- LSP manager
  ["williamboman/nvim-lsp-installer"] = {
    after = "nvim-lspconfig",
    config = function()
      require "configs.nvim-lsp-installer"
      require "configs.lsp"
    end,
  },

  -- LSP symbols
  ["stevearc/aerial.nvim"] = {
    module = "aerial",
    cmd = { "AerialToggle", "AerialOpen", "AerialInfo" },
    config = function()
      require "configs.aerial"
    end,
  },

  -- Formatting and linting
  ["jose-elias-alvarez/null-ls.nvim"] = {
    commit = 'fbb1929b29beff82e0fc495670f00ef4b3bcbcd3',
    event = { "BufRead", "BufNewFile" },
    config = function()
      local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

      local null_ls = require("null-ls")

      local sources = {
        null_ls.builtins.code_actions.refactoring,
        -- null_ls.builtins.diagnostics.actionlint, -- brew install actionlint
        null_ls.builtins.diagnostics.checkmake, -- brew install checkmake
        -- null_ls.builtins.diagnostics.cppcheck, -- brew install cppcheck
        -- null_ls.builtins.diagnostics.markdownlint, -- brew install markdownlint-cli
        -- null_ls.builtins.diagnostics.misspell, -- needs go
        -- null_ls.builtins.diagnostics.mypy,
        -- null_ls.builtins.diagnostics.proselint, -- brew install proselint
        null_ls.builtins.formatting.black,
        null_ls.builtins.formatting.isort.with({
          extra_args = { "--profile", "black"}
        }),
        -- null_ls.builtins.formatting.latexindent, -- brew install latexindent
        -- null_ls.builtins.formatting.prettier, -- brew install prettier
      }

      null_ls.setup({
        -- you can reuse a shared lspconfig on_attach callback here
        on_attach = function(client, bufnr)
          if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            vim.api.nvim_create_autocmd("BufWritePre", {
              group = augroup,
              buffer = bufnr,
              -- on 0.8, you should use vim.lsp.buf.format instead
              callback = vim.lsp.buf.formatting_sync,
            })
          end
        end,
        sources = sources
      })
    end,
  },

  -- Fuzzy finder
  ["nvim-telescope/telescope.nvim"] = {
    cmd = "Telescope",
    module = "telescope",
    config = function()
      require "configs.telescope"
    end,
  },

  -- Fuzzy finder syntax support
  [("nvim-telescope/telescope-%s-native.nvim"):format(vim.fn.has "win32" == 1 and "fzy" or "fzf")] = {
    after = "telescope.nvim",
    run = vim.fn.has "win32" ~= 1 and "make" or nil,
    config = function()
      require("telescope").load_extension(vim.fn.has "win32" == 1 and "fzy_native" or "fzf")
    end,
  },

  ["nvim-telescope/telescope-github.nvim"] = {
    after = "telescope.nvim",
    config = function()
       require("telescope").load_extension("gh")
     end,
  },

  ["LinArcX/telescope-env.nvim"] = {
    after = "telescope.nvim",
    config = function()
      require("telescope").load_extension("env")
    end,
  },

  ["gfeiyou/command-center.nvim"] = {
    after = "telescope.nvim",
    config = function()
      require("telescope").load_extension("command_center")
    end,
  },

  ['nvim-telescope/telescope-dap.nvim'] = {
    after = "telescope.nvim",
    config = function()
      require("telescope").load_extension("dap")
    end,
  },

  ['nvim-telescope/telescope-packer.nvim'] = {
    after = "telescope.nvim",
    config = function()
      require("telescope").load_extension("packer")
    end,
  },

  ["benfowler/telescope-luasnip.nvim"] = {
    after = "telescope.nvim",
    config = function()
      require('telescope').load_extension('luasnip')
    end,
  },

  ['ThePrimeagen/harpoon'] = {
    after = "telescope.nvim",
    config = function()
      require("telescope").load_extension('harpoon')
    end,
  },

  ["nvim-telescope/telescope-bibtex.nvim"] = {
    after = 'telescope.nvim',
    config = function()
      require('telescope').load_extension("bibtex")
    end,
  },

  ['justusschock/telescope-conda.nvim'] = {
    after = 'telescope.nvim',
    -- config = function()
      -- function _activate_conda_env()
        -- require'telescope'.extensions.conda.conda{}
          -- vim.g.python3_host_prog = vim.env.CONDA_DEFAULT_ENV .. '/bin/python'
      -- end
      -- vim.api.nvim_create_user_command('CondaEnvSelect', _activate_conda_env, { bang = true })
    -- end,
  },

  -- Git integration
  ["lewis6991/gitsigns.nvim"] = {
    event = "BufEnter",
    config = function()
      require "configs.gitsigns"
    end,
  },

  -- Start screen
  ["goolord/alpha-nvim"] = {
    after = "nvim-web-devicons",
    cmd = "Alpha",
    module = "alpha",
    config = function()
      require "configs.alpha"
    end,
  },

  -- Color highlighting
  ["norcalli/nvim-colorizer.lua"] = {
    event = { "BufRead", "BufNewFile" },
    config = function()
      require "configs.colorizer"
    end,
  },

  -- Autopairs
  ["windwp/nvim-autopairs"] = {
    event = "InsertEnter",
    config = function()
      require "configs.autopairs"
    end,
  },

  -- Terminal
  ["akinsho/toggleterm.nvim"] = {
    cmd = "ToggleTerm",
    module = { "toggleterm", "toggleterm.terminal" },
    config = function()
      require "configs.toggleterm"
    end,
  },

  -- Commenting
  ["numToStr/Comment.nvim"] = {
    module = { "Comment", "Comment.api" },
    keys = { "gc", "gb", "g<", "g>" },
    config = function()
      require "configs.Comment"
    end,
  },

  -- Indentation
  ["lukas-reineke/indent-blankline.nvim"] = {
    event = "BufRead",
    config = function()
      require "configs.indent-line"
    end,
  },

  -- Keymaps popup
  ["folke/which-key.nvim"] = {
    module = "which-key",
    config = function()
      require "configs.which-key"
    end,
  },

  -- Smooth scrolling
  ["declancm/cinnamon.nvim"] = {
    event = { "BufRead", "BufNewFile" },
    config = function()
      require "configs.cinnamon"
    end,
  },

  -- Smooth escaping
  ["max397574/better-escape.nvim"] = {
    event = "InsertCharPre",
    config = function()
      require "configs.better_escape"
    end,
  },

  -- Get extra JSON schemas
  ["b0o/SchemaStore.nvim"] = { module = "schemastore" },

  -- Session manager
  ["Shatur/neovim-session-manager"] = {
    module = "session_manager",
    cmd = "SessionManager",
    event = "BufWritePost",
    config = function()
      require "configs.session_manager"
    end,
  },

  -- ["github/copilot.vim"] = {
  --   config = function()
  --     -- vim.g.copilot_no_tab_map = true
  --     vim.g.copilot_enabled = true
  --   end,
  -- },

  ['ludovicchabant/vim-gutentags'] = {
    config = function()
      -- vim.cmd('set tags+=tags,.git/tags')
      vim.g.gutentags_enabled = 1
      vim.g.gutentags_generate_on_missing = 1
      vim.g.gutentags_generate_on_write = 1
      vim.g.gutentags_resolve_symlinks = 1
      vim.g.gutentags_ctags_tagfile = '.git/tags'
      vim.g.gutentags_project_root = { '.git' }
    end,
  },

  ['mfussenegger/nvim-dap'] = {
    config = function()
      vim.fn.sign_define('DapBreakpoint', {text='', texthl='error', linehl='', numhl=''})
    end,

  },

  ['rcarriga/nvim-dap-ui'] = {
    after = 'nvim-dap',
    config = function()
      require("dapui").setup()

      local dap, dapui = require("dap"), require("dapui")
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end,
  },

  ['theHamsta/nvim-dap-virtual-text'] = {
    after = 'nvim-dap',
    config = function()
      require("nvim-dap-virtual-text").setup()
    end,
  },

  ['mfussenegger/nvim-dap-python'] = {
    after = 'nvim-dap',
    config = function()
      require('dap-python').setup('python')
      require('dap-python').test_runner = 'pytest'
    end,
  },
 
  ['airblade/vim-rooter'] = {
    config = function()
      vim.g.rooter_silent_chdir = 1
      vim.g.rooter_cd_cmd = 'lcd'
      vim.g.rooter_resolve_links = 1
      vim.g.rooter_patterns = { '.git', '.git/' }
    end,
  },

  ['jeffkreeftmeijer/vim-numbertoggle'] = {},

  ["cespare/vim-toml"] = {},
  ["nvim-neotest/neotest-python"] = {
    commit = 'de234d600e728f2350950355bb5c8d723ea7dff7',
  },

  ["nvim-neotest/neotest"] = {
    commit = '595e76935b5e02caa6a53a2377f0f55c989e81cd',
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",
    },
    config = function()
      require("neotest").setup({
        icons = {
          running = "↻",
        },
        adapters = {
          require("neotest-python")({
          -- Extra arguments for nvim-dap configuration
            dap = { justMyCode = false, console = 'integratedTerminal' },
            runner = "pytest",
          }),
        },
      })
    end,
  },

  ['beauwilliams/focus.nvim'] = {
    config = function()
      require('focus').setup()
    end,
  },

  ["Pocco81/auto-save.nvim"] = {
    config = function()
      require('auto-save').setup()
    end,
  },

  ["folke/todo-comments.nvim"] = {
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require("todo-comments").setup {}
    end
  },
  ['s1n7ax/nvim-search-and-replace'] = {
    config = function() 
      require'nvim-search-and-replace'.setup() 
    end,
  },

  -- ['lervag/vimtex'] = {
  --   config = function()
  --     vim.g.vimtex_view_method = 'skim'
  --     vimg.g.vimtex_compiler_method = 'generic'
  --     vim.g.vimtex_compiler_generic = {
  --       command = 'docker run --ipc=host --rm -it -v ' .. vim.fn.getcwd() .. ':/workdir -u $(id -u ${USER}):$(id -g ${USER}) justusschock/diss_tex:latest make'
  --     }
  --   end,
  -- }

}
if astronvim.updater.snapshot then
  for plugin, options in pairs(astro_plugins) do
    local pin = astronvim.updater.snapshot[plugin:match "/([^/]*)$"]
    options.commit = pin and pin.commit or options.commit
  end
end

local user_plugin_opts = astronvim.user_plugin_opts
local packer = astronvim.initialize_packer()
packer.startup {
  function(use)
    for key, plugin in pairs(user_plugin_opts("plugins.init", astro_plugins)) do
      if type(key) == "string" and not plugin[1] then
        plugin[1] = key
      end
      use(plugin)
    end
  end,
  config = user_plugin_opts("plugins.packer", {
    compile_path = astronvim.default_compile_path,
    display = {
      open_fn = function()
        return require("packer.util").float { border = "rounded" }
      end,
    },
    profile = {
      enable = true,
      threshold = 0.0001,
    },
    git = {
      clone_timeout = 300,
      subcommands = {
        update = "pull --rebase",
      },
    },
    auto_clean = true,
    compile_on_sync = true,
  }),
}

astronvim.compiled()
