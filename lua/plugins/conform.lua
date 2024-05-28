return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local conform = require "conform"

    conform.setup {
      formatters_by_ft = {
        javascript = { { "biome", "prettier" } },
        typescript = { { "biome", "prettier" } },
        svelte = { "prettier" },
        css = { "prettier" },
        html = { "prettier" },
        json = { "biome" },
        yaml = { "prettier" },
        markdown = { "prettier" },
        graphql = { "prettier" },
        lua = { "stylua" },
        python = { "ruff", "black" },
        sql = { "sqlfmt" },
      },
      format_on_save = {
        lsp_fallback = true,
        async = false,
        timeout_ms = 500,
      },
    }
  end,
}
