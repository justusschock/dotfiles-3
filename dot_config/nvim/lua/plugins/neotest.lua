return {
    { "nvim-neotest/neotest-python" },
    {
        "nvim-neotest/neotest",
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
}