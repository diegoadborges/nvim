return {
  "neovim/nvim-lspconfig",
  config = function()
    local on_attach = require("nvchad.configs.lspconfig").on_attach
    local on_init = require("nvchad.configs.lspconfig").on_init
    local capabilities = require("nvchad.configs.lspconfig").capabilities

    local servers = { "sqlls", "ts_ls", "html", "cssls", "gopls" }
    local lspconfig = vim.lsp.config

    -- lspconfig.jdtls.setup {}

    local config_path = vim.fn.stdpath "config"

    lspconfig("lua_ls", {
      settings = {
        Lua = {
          runtime = {
            version = "LuaJIT",
          },

          diagnostics = {
            globals = {
              "vim",
              "packer_plugins",
            },
          },
          workspace = {
            library = {
              [vim.fn.expand "$VIMRUNTIME/lua"] = true,
              [config_path .. "/lua"] = true,
            },
          },
        },
      },
    })

    lspconfig("pyright", {
      settings = {
        python = {
          analysis = {
            autoSearchPaths = true,
            diagnosticMode = "workspace",
            useLibraryCodeForTypes = true,
            typeCheckingMode = "basic",
            reportPossiblyUnboundVariable = "error",
            reportUnboundVariable = "error",
          },
        },
      },
    })

    for _, lsp in ipairs(servers) do
      lspconfig(lsp, {
        on_attach = on_attach,
        on_init = on_init,
        capabilities = capabilities,
      })
    end
  end,
}
