return {
    { 
        "nvim-treesitter/nvim-treesitter",
        opts = function(_, opts)
            opts.ensure_installed = vim.list_extend(
                opts.ensure_installed, 
                { 
                    'go'
                }
            )
        end
    }
}