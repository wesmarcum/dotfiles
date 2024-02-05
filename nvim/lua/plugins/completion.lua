-- nvim-cmp
-- https://github.com/hrsh7th/nvim-cmp
-- This is kind of a hack to set completion options for nvim-cmp.
-- See nvim-cmp.lua for additional comments.
return {
  {
    "hrsh7th/nvim-cmp",
    opts = {
      completion = { completeopt = "menu,menuone,noselect" },
    },
  },
}
