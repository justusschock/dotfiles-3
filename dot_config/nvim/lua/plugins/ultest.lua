
local function config_test()
    vim.api.nvim_exec(
      [[
         
          let g:ultest_use_pty = 1
          " Python
          let test#python#runner = 'pytest'
          let test#python#pytest#options = "--color=yes"
      ]],
      false
    )
  end

local function python_debugger(cmd)
    local non_modules = { "python", "pipenv", "poetry" }
    local module_index = 1
    if vim.tbl_contains(non_modules, cmd[1]) then
      module_index = 3
    end
    local module = cmd[module_index]
  
    local args = vim.list_slice(cmd, module_index + 1)
    return {
      dap = {
        type = "python",
        request = "launch",
        module = module,
        args = args,
      },
    }
  end
  local function config_ultest()
    local builders = {
      python = python_debugger 
    }
    require("ultest").setup { builders = builders }
  end
  
config_test()
config_ultest()
  
