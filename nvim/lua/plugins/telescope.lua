-- telescope
-- https://github.com/nvim-telescope/telescope.nvim
return {
  {
    "nvim-telescope/telescope.nvim",
    opts = {
      defaults = {
        mappings = {
          i = {
            -- Send <esc> with "jk".
            ["jk"] = { "<esc>", type = "command" },
            -- Ctrl-j and Ctrl-k to move up/down selections in insert mode.
            ["<C-k>"] = "move_selection_previous",
            ["<C-j>"] = "move_selection_next",
          },
        },
      },
    },
  },
}
