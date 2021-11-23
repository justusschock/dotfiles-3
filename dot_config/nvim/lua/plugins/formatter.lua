
      
            
      
require('formatter').setup({
    filetype = {
      javascript = {
        -- prettier
        function()
          return {
            exe = "prettier",
            args = {"--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)), '--single-quote'},
            stdin = true
          }
        end
      },
      yaml = {
        -- prettier
        function()
          return {
            exe = "prettier",
            args = {"--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)), '--single-quote'},
            stdin = true
          }
        end
      },
      json = {
        -- prettier
        function()
          return {
            exe = "prettier",
            args = {"--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)), '--single-quote'},
            stdin = true
          }
        end
      },
      sh = {
        -- Shell Script Formatter
       function()
         return {
           exe = "shfmt",
           args = { "-i", 2 },
           stdin = true,
         }
       end,
      },
      python = {
        -- Configuration for psf/black
        function()
          return {
            exe = "black", -- this should be available on your $PATH
            args = { '-' },
            stdin = true,
          }
        end
      },
      cpp = {
        function()
            return {
                exe = "clang-format",
                args = {"--assume-filename", vim.api.nvim_buf_get_name(0)},
                stdin = true,
                cwd = vim.fn.expand('%:p:h')  -- Run clang-format in cwd of the file.
            }
    
        end
      },
    
      python = {
            function()
                return {
                exe = "black", -- this should be available on your $PATH
                args = { '-' },
                stdin = true,
                }
            end,
            function()
                return {
                    exe = "isort",
                    args = {"--profile", "black", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0))},
                    stdin = true
                }
            end, 
            function()
                return {
                    exe = "autoimport",
                    args = {vim.fn.fnameescape(vim.api.nvim_buf_get_name(0))},
                    stdin = true
                }
            end
        
      },
    }
})

vim.api.nvim_exec([[
augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost *.js,*.rs,*.lua,*.sh,*.py,*.yaml,*.json,*.md FormatWrite
augroup END
]], true)