return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local conform = require "conform"

    conform.setup {
      formatters_by_ft = {
        javascript = { "prettier" },
        typescript = { "prettier" },
        svelte = { "prettier" },
        css = { "prettier" },
        html = { "prettier" },
        json = { "prettier" },
        yaml = { "prettier" },
        markdown = { "prettier" },
        graphql = { "prettier" },
        lua = { "stylua" },
        python = { "ruff", "ruff_format" },
        sql = { "sqlfmt" },
        java = { "google-java-format" },
        cpp = { "clang-format" },
        go = { "gofmt", "goimports" },
        toml = { "taplo" },
      },
      format_on_save = {
        lsp_fallback = true,
        async = false,
      },
    }
  end,
}
