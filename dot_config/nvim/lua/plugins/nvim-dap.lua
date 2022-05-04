local dap, dapui = require("dap")

vim.fn.sign_define('DapBreakpoint', {text='', texthl='error', linehl='', numhl=''})
-- ADAPTERS

-- local handle = io.popen("which python")
-- local python_path = handle:read("*a")
-- handle:close()

-- require('dap-python').setup(python_path)
require('dap-python').setup('python')

require('dap-python').test_runner = 'pytest'
