return {
  "neovim/nvim-lspconfig",
  config = function()
    local on_attach = require("nvchad.configs.lspconfig").on_attach
    local on_init = require("nvchad.configs.lspconfig").on_init
    local capabilities = require("nvchad.configs.lspconfig").capabilities

    local servers = { "sqlls", "pyright", "tsserver", "html", "cssls", "lua_ls", "gopls" }
    local lspconfig = require "lspconfig"

    -- Fix hover in jdtls
    local jdtls_config = require "java-core.ls.servers.jdtls.config"
    local opts = jdtls_config.get_config()
    opts.init_options.extendedClientCapabilities.clientHoverProvider = nil
    jdtls_config.get_config = function()
      return opts
    end

    require("java").setup {}
    lspconfig.jdtls.setup {}

    lspconfig.clangd.setup {
      on_attach = function(client, bufnr)
        client.server_capabilities.signatureHelpProvider = false
        on_attach(client, bufnr)
      end,
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
