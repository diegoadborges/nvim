return {
  "linux-cultist/venv-selector.nvim",
  branch = "regexp",
  dependencies = { "neovim/nvim-lspconfig", "nvim-telescope/telescope.nvim", "mfussenegger/nvim-dap-python" },
  opts = {
    name = { ".venv" },
  },
  event = "VeryLazy", -- Optional: needed only if you want to type `:VenvSelect` without a keymapping
  keys = {
    { "<leader>vs", "<cmd>VenvSelect<cr>" },
  },
}
