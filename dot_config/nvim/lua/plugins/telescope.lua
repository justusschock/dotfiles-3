return {
    { 'justusschock/telescope-conda.nvim' },
    {
        'nvim-telescope/telescope.nvim',
        config = function()
            require('telescope').setup({
                extensions = {
                    conda = { anaconda_path = '/opt/homebrew/Caskroom/miniconda'}
                }
            })
            telescope = require('telescope')
            -- telescope.load_extension("conda")

            function _activate_conda_env()
                telescope.extensions.conda.conda{}
            end
            vim.api.nvim_create_user_command('CondaEnvSelect', _activate_conda_env, { bang = true })
        end,
    },
    { 'cljoly/telescope-repo.nvim' },
    {  
        'airblade/vim-rooter',
        config = function()
          vim.g.rooter_silent_chdir = 1
          vim.g.rooter_cd_cmd = 'lcd'
          vim.g.rooter_resolve_links = 1
          vim.g.rooter_patterns = { '.git', '.git/' }
        end,
      },
    {
        'pwntester/octo.nvim',
        requires = {
            'nvim-lua/plenary.nvim',
            'nvim-telescope/telescope.nvim',
            'kyazdani42/nvim-web-devicons',
        },
        config = function ()
          require("octo").setup()
          require('telescope').load_extension("octo")
        end
    },
    { 
        "LinArcX/telescope-env.nvim", 
        config = function()
            require("telescope").load_extension("env")
        end,
    },
    {
        'nvim-telescope/telescope-dap.nvim',
        config = function()
            require("telescope").load_extension("dap")
        end,
    },
}