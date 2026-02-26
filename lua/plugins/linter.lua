return {
  "mfussenegger/nvim-lint",
  event = {
    "BufReadPre",
    "BufNewFile",
  },
  config = function()
    local lint = require "lint"
    lint.linters_by_ft = {
      javascript = { "biomejs" },
      typescript = { "biomejs" },
      -- json = { "biomejs" },
      go = { "golangcilint" },
      python = { "ruff" },
    }

    -- Fix biomejs parser to handle both errors (×) and warnings (⚠)
    lint.linters.biomejs.parser = function(output)
      local diagnostics = {}
      local fetch_message = false
      local lnum, col, code, message

      for _, line in ipairs(vim.fn.split(output, "\n")) do
        if fetch_message then
          _, _, message = string.find(line, "[×⚠!]%s*(.+)")
          if message then
            message = message:gsub("^%s+", "")
            table.insert(diagnostics, {
              source = "biomejs",
              lnum = tonumber(lnum) - 1,
              col = tonumber(col),
              message = message,
              code = code,
            })
            fetch_message = false
          end
        else
          _, _, lnum, col, code = string.find(line, "[^:]+:(%d+):(%d+)%s([%a%/]+)")
          if lnum then
            fetch_message = true
          end
        end
      end
      return diagnostics
    end

    local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
      group = lint_augroup,
      callback = function()
        lint.try_lint()
      end,
    })
  end,
}
