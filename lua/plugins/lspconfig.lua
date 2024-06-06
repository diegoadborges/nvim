return {
  "neovim/nvim-lspconfig",
  config = function()
    local on_attach = require("nvchad.configs.lspconfig").on_attach
    local on_init = require("nvchad.configs.lspconfig").on_init
    local capabilities = require("nvchad.configs.lspconfig").capabilities

    local lspconfig = require "lspconfig"
    local servers = { "sqlls", "pyright", "tsserver", "html", "cssls", "lua_ls" }

    require("java").setup {}
    lspconfig.jdtls.setup {
      on_attach = on_attach,
      capabilities = capabilities,
      filetypes = { "java" },
    }

    for _, lsp in ipairs(servers) do
      lspconfig[lsp].setup {
        on_attach = on_attach,
        on_init = on_init,
        capabilities = capabilities,
      }
    end
  end,
}
