local linter_enabled = false

local toggle_linter = function()
  local lint = require "lint"

  linter_enabled = not linter_enabled
  if not linter_enabled then
    vim.diagnostic.reset()
    vim.notify("Linter disabled", vim.log.levels.INFO)
    return
  end

  vim.notify("Linter enabled", vim.log.levels.INFO)
  lint.try_lint()
  lint.try_lint "cspell"
end

local command = vim.api.nvim_create_user_command
command("ToggleLinter", toggle_linter, {})
