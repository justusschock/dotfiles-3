local status_ok, treesitter = pcall(require, "nvim-treesitter.configs")
if status_ok then
  treesitter.setup(astronvim.user_plugin_opts("plugins.treesitter", {
    ensure_installed = "all",
    sync_install = false,
    ignore_install = {"phpdoc"},
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },
    context_commentstring = {
      enable = true,
      enable_autocmd = false,
    },
    rainbow = {
      enable = true,
      disable = { "html" },
      extended_mode = false,
      max_file_lines = nil,
    },
    autopairs = { enable = true },
    autotag = { enable = true },
    incremental_selection = { enable = true },
    indent = { enable = false },
    auto_install = true
  }))
end
