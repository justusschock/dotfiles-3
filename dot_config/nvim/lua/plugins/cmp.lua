-- auto completion
return {
    {
        "hrsh7th/nvim-cmp",
        dependencies = { "hrsh7th/cmp-cmdline", 'hrsh7th/cmp-nvim-lsp-signature-help', },
        ---@param opts cmp.ConfigSchema
        opts = function(_, opts)
          local cmp = require("cmp")
          opts.sources = cmp.config.sources(vim.list_extend(opts.sources, { { name = "nvim_lsp_signature_help" } }))
          cmp.setup.cmdline('/', {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {
              { name = 'buffer' }
            }
            })
          cmp.setup.cmdline(':', {
                mapping = cmp.mapping.preset.cmdline(),
                sources = cmp.config.sources({
                { name = 'path' }
                }, {
                {
                    name = 'cmdline',
                    option = {
                    ignore_cmds = { 'Man', '!' }
                    }
                }
                })
            })
          end,
    },
    -- {
    --     'smolck/command-completion.nvim',
    --     config = function()
    --         require('command-completion').setup()
    --     end,
    -- },
}