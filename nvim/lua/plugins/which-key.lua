-- which-key.nvim
-- https://github.com/folke/which-key.nvim
return {
  "folke/which-key.nvim",
  opts = {
    spec = {
      { "<leader>d", group = "date/time" },
      { "<leader>y", group = "yank" },
    },
  },
}
