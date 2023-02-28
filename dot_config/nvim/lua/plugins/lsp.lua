
return {  
    {
        "neovim/nvim-lspconfig",
        ---@class PluginLspOpts
        opts = function(_, opts)
            lspconfig = require('lspconfig')
            opts.servers = vim.list_extend(
                opts.servers, 
                { 
                    pyright = {
                        settings = {
                            python = {
                                analysis = {
                                    typeCheckingMode = "off",
                                },
                            },
                        },
                    } 
                }
            )
            capabilities = require('cmp_nvim_lsp').default_capabilities()
            lspconfig['pyright'].setup(
                {
                    capabilities = capabilities
                }
            )
        end
    },
}