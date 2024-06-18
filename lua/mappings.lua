require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map("n", "]b", function()
  require("nvchad.tabufline").next()
end, { desc = "Buffer Goto next" })

map("n", "[b", function()
  require("nvchad.tabufline").prev()
end, { desc = "Buffer Goto prev" })

map({ "n", "i", "v" }, "<C-s>", "<cmd> wa <cr>")

map({ "n" }, "<leader>v", ":vsplit<space>")
map({ "n" }, "<leader>db", "<cmd> DapToggleBreakpoint <CR>", { desc = "Add breakpoint at line" })
map({ "n" }, "<leader>dr", "<cmd> DapContinue <CR>", { desc = "Start or continue the debugger" })

map({ "n" }, "<leader>rs", ":NvimTreeResize <space>", { desc = "Resize the NvimTree" })
