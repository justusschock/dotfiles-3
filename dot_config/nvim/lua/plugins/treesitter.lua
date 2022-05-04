require'nvim-treesitter.configs'.setup {
  ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  ignore_install = { "haskell", 'phpdoc' }, -- list of languages to ignore
  highlight = {
    enable = true,              -- false will disable the whole extension
  },
  context_commentstring = {
    enable = true
  },
  keymaps = {
    goto_definition = "gd",
    list_definitions = "gD",
    list_definitions_toc = "gO",
    goto_next_usage = "gtnu",
    goto_previous_usage = "gtpu",
  },
}
