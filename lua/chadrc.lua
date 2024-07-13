-- This file  needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/NvChad/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

M.ui = {
  theme = "gruvchad",
  transparency = false,
  lsp_semantic_tokens = true,
  theme_toggle = { "gruvbox", "one_light" },
  lsp = { signature = false },
}

M.plugins = "plugins"

return M
