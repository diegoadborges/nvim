return {
  "neovim/nvim-lspconfig",
  config = function()
    local on_attach = require("nvchad.configs.lspconfig").on_attach
    local on_init = require("nvchad.configs.lspconfig").on_init
    local capabilities = require("nvchad.configs.lspconfig").capabilities

    local servers = { "sqlls", "ts_ls", "html", "cssls", "gopls", "lua_ls", "pyright", "bashls", "terraformls", "helm_ls",
      "yamlls" }
    local lspconfig = vim.lsp.config

    -- local buffers_enabled = { "pyright" }

    -- for _, lsp in ipairs(buffers_enabled) do
    --   vim.lsp.enable(lsp)
    -- end

    -- vim.lsp.enable "pyright"
    -- lspconfig.jdtls.setup {}

    local config_path = vim.fn.stdpath "config"


    lspconfig("helm_ls", {
      settings = {
        ['helm-ls'] = {
          yamlls = {
            path = "yaml-language-server",
          }
        }
      }
    })

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
      vim.lsp.enable(lsp)
      lspconfig(lsp, {
        on_attach = on_attach,
        on_init = on_init,
        capabilities = capabilities,
      })
    end
  end,
}
