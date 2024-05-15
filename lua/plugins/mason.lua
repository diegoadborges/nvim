return {
  "williamboman/mason.nvim",
  opts = {
    ensure_installed = {
      "stylua",
      "black",
      "debugpy",
      "mypy",
      "ruff",
      "pyright",
      "biome",
      "typescript-language-server",
      "sqlfluff",
      "sql-formatter",
      "sqlls",
    },
  },
}
