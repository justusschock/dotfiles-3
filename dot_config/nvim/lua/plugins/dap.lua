return {
    {
        'mfussenegger/nvim-dap',
        config = function()
            vim.fn.sign_define('DapBreakpoint', {text="", texthl='error', linehl='', numhl=''})
        end,

    },
    {
        'rcarriga/nvim-dap-ui',
        config = function()
            require("dapui").setup()
                local dap, dapui = require("dap"), require("dapui")
                dap.listeners.after.event_initialized["dapui_config"] = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated["dapui_config"] = function()
                dapui.close()
            end
            dap.listeners.before.event_exited["dapui_config"] = function()
                dapui.close()
            end
        end,
    },
    {
        'theHamsta/nvim-dap-virtual-text',
        config = function()
            require("nvim-dap-virtual-text").setup()
        end,
    },
    {
        'mfussenegger/nvim-dap-python',
        config = function()
            -- require('dap-python').setup('/opt/homebrew/Caskroom/miniconda/base/envs/debugpy/bin/python')
            require('dap-python').setup()
            require('dap-python').test_runner = 'pytest'
        end,
    },
}