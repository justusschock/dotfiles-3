local status_ok, toggleterm = pcall(require, "toggleterm")
if status_ok then
  toggleterm.setup(astronvim.user_plugin_opts("plugins.toggleterm", {
    size = 10,
    open_mapping = [[<c-\>]],
    shading_factor = 2,
    direction = "float",
    float_opts = {
      border = "curved",
      highlights = {
        border = "Normal",
        background = "Normal",
      },
    },
    on_open = function(term)
        vim.cmd("startinsert!")
        vim.api.nvim_buf_set_keymap(term.bufnr, "t", "<C-t>", "<cmd>ToggleTerm<CR>", {noremap = true, silent = true}) -- Adds toggle term command keymap to current buffer
        vim.api.nvim_buf_set_keymap(term.bufnr, "t", "<C-n>", "<C-\\><C-n>", {noremap = true, silent = true}) -- Adds keymap to current buffer to get back to normal mode easier
    end, 

  }))
end

