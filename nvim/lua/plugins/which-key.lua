-- which-key.nvim
-- https://github.com/folke/which-key.nvim
return {
  "folke/which-key.nvim",
  opts = {
    defaults = {
      ["<leader>d"] = { name = "+date/time" },
      ["<leader>y"] = { name = "+yank" },
    },
  },
}
