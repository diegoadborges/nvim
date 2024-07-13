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

map({ "n", "v" }, "<leader>rs", ":NvimTreeResize <space>", { desc = "Resize the NvimTree" })
map({ "n", "v" }, "<leader>rd", vim.lsp.buf.rename, { desc = "Rename references" })
map({ "n", "v" }, "<leader>fr", "<cmd> :Telescope lsp_references <CR>", { desc = "Find references" })

map({ "n" }, "<A-k>", "<cmd> :JavaRunnerRunMain  <CR>", { desc = "Run main class" })
map({ "n" }, "<A-l>", "<cmd> :JavaRunnerToggleLogs  <CR>", { desc = "Toggle java logs" })

map("n", "<leader>nd", "<cmd>NoiceDismiss<CR>", { desc = "Dismiss Noice Message" })
