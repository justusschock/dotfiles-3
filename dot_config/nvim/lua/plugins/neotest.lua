return {
    { "nvim-neotest/neotest-python" },
    { "nvim-neotest/neotest-go" },
    {
        "nvim-neotest/neotest",
        config = function()
            local neotest_ns = vim.api.nvim_create_namespace("neotest")
            vim.diagnostic.config({
                virtual_text = {
                  format = function(diagnostic)
                    local message =
                      diagnostic.message:gsub("\n", " "):gsub("\t", " "):gsub("%s+", " "):gsub("^%s+", "")
                    return message
                  end,
                },
              }, neotest_ns)
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
                    require("neotest-go")({
                        {
                            experimental = {
                              test_table = true,
                            },
                            args = { "-cover", "-timeout=20m", "-race" }
                          }
                    })
                },
            })
        end,
    },
}