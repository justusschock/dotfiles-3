local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local null_ls = require("null-ls")

local sources = {
    null_ls.builtins.code_actions.refactoring,
    null_ls.builtins.diagnostics.actionlint, -- brew install actionlint
    null_ls.builtins.diagnostics.checkmake, -- brew install checkmake
    null_ls.builtins.diagnostics.cppcheck, -- brew install cppcheck
    null_ls.builtins.diagnostics.markdownlint, -- brew install markdownlint-cli
    -- null_ls.builtins.diagnostics.misspell, -- needs go
    null_ls.builtins.diagnostics.mypy,
    null_ls.builtins.diagnostics.proselint, -- brew install proselint
    null_ls.builtins.formatting.black,
    null_ls.builtins.formatting.isort.with({
        extra_args = { "--profile", "black"}
    }),
    null_ls.builtins.formatting.latexindent, -- brew install latexindent
    null_ls.builtins.formatting.prettier, -- brew install prettier
}

null_ls.setup({
    -- you can reuse a shared lspconfig on_attach callback here
    on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = augroup,
                buffer = bufnr,
                -- on 0.8, you should use vim.lsp.buf.format instead
                callback = vim.lsp.buf.formatting_sync,
            })
        end
    end,
    sources = sources
})