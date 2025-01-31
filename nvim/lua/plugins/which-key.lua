-- which-key.nvim
-- https://github.com/folke/which-key.nvim
return {
  "folke/which-key.nvim",
  opts = {
    spec = {
      { "<leader>D", group = "date/time", icon = { icon = "" } },
      { "<leader>y", group = "yank", icon = { icon = "󰆏" } },
    },
  },
}
