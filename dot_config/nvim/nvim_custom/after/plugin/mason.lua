local status, mason = pcall(require, "mason")
if (not status) then return end
local status2, lspconfig = pcall(require, "mason-lspconfig")
if (not status2) then return end

mason.setup({

})

lspconfig.setup {
  ensure_installed = { "sumneko_lua", "pyright", "ansiblels", "bashls", "clangd", "cmake", "dockerls", "gopls", "grammarly", "jsonls", "tsserver", "texlab", "remark_ls", "rust_analyzer", "terraformls", "yamlls"}, -- TODO: Add more lsps
}