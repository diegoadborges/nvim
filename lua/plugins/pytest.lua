return {
  "richardhapb/pytest.nvim",
  event = "VeryLazy",
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  opts = {
    -- docker = {
    --   enabled = true,
    --   enable_docker_compose = true,
    --   docker_compose_file = "compose.test.yml",
    -- },
  },
  config = function(_, opts)
    require("pytest").setup(opts)
  end,
}
