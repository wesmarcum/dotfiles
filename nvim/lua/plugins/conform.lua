-- conform.nvim
-- https://github.com/stevearc/conform.nvim
-- Set options for formatters.
return {
  "stevearc/conform.nvim",
  opts = {
    formatters = {
      -- Set indent to two spaces for shell scripts.
      shfmt = {
        prepend_args = { "-i", "2", "-ci", "-bn" },
      },
    },
  },
}
