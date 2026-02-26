return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local conform = require "conform"

    conform.setup {
      formatters_by_ft = {
        javascript = { "biome" },
        typescript = { "biome" },
        svelte = { "prettier" },
        css = { "prettier" },
        html = { "prettier" },
        json = { "biome" },
        jsonc = { "biome" },
        yaml = { "prettier" },
        markdown = { "prettier" },
        graphql = { "prettier" },
        lua = { "stylua" },
        python = { "ruff", "ruff_format" },
        sql = { "sqlfmt" },
        java = { "google-java-format" },
        cpp = { "clang-format" },
        go = { "gofumpt", "goimports", "golines" },
        toml = { "taplo" },
        bash = { "beautysh" },
        sh = { "beautysh" },
      },
      format_on_save = {
        lsp_fallback = true,
        async = false,
      },
    }

    require("conform").formatters.biome = {
      args = { "check", "--fix", "--stdin-file-path", "$FILENAME" },
    }
  end,
}
