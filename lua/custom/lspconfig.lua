-- custom.plugins.lspconfig
local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local servers = {
  "lua-language-server",
  "pyright",
  "bash-language-server",
  "clangd",
  "shellcheck",
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

-- tutorials
  -- https://nvchad.com/config/Lsp%20stuff
  -- https://www.youtube.com/watch?v=B-bK-FJ--H8 
