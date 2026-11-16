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
    -- NOTE: markers are multi-byte UTF-8, so match them as literal prefixes,
    -- not inside a [] byte class (that matched the first byte of "│").
    local markers = { "×", "✖", "⚠", "!" }
    local function strip_marker(line)
      local trimmed = line:gsub("^%s+", "")
      for _, m in ipairs(markers) do
        if trimmed:sub(1, #m) == m then
          return (trimmed:sub(#m + 1):gsub("^%s+", ""))
        end
      end
    end

    lint.linters.biomejs.parser = function(output, bufnr)
      local diagnostics = {}
      local buf_path = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(bufnr), ":p")
      local fetch_message = false
      local lnum, col, code

      for _, line in ipairs(vim.fn.split(output, "\n")) do
        local file, l, c, cd = line:match "^(.-):(%d+):(%d+)%s+([%a%/]+)"
        if file then
          -- Only keep diagnostics for this buffer (skip e.g. biome.json config errors)
          fetch_message = vim.fn.fnamemodify(file, ":p") == buf_path
          lnum, col, code = l, c, cd
        elseif fetch_message then
          local message = strip_marker(line)
          if message and message ~= "" then
            table.insert(diagnostics, {
              source = "biomejs",
              lnum = tonumber(lnum) - 1,
              col = tonumber(col) - 1,
              message = message,
              code = code,
            })
            fetch_message = false
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
