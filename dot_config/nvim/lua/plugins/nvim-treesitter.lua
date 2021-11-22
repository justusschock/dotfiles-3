-----------------------------------------------------------
-- Treesitter configuration file
-----------------------------------------------------------

-- Plugin: nvim-treesitter
-- https://github.com/nvim-treesitter/nvim-treesitter

require'nvim-treesitter.configs'.setup {
    ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
    sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
    highlight = {
      enable = true,              -- false will disable the whole extension
      -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
      -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
      -- Using this option may slow down your editor, and you may see some duplicate highlights.
      -- Instead of true it can also be a list of languages
      additional_vim_regex_highlighting = false,
          
    },
    indent = {
        enable = true
    },
    refactor = {
        highlight_definitions = { enable = true },
        highlight_current_scope = { enable = true },
        smart_rename = {
            enable = true,
            keymaps = {
              smart_rename = "rf",
            },
          },
        navigation = {
        enable = true,
        keymaps = {
            goto_definition = "gd",
            list_definitions = "gD",
            list_definitions_toc = "gO",
            goto_next_usage = "gtnu",
            goto_previous_usage = "gtpu",
        },
        },
      }
  }