-- blink.com
-- https://github.com/saghen/blink.cmp
return {
  "saghen/blink.cmp",
  opts = function(_, opts)
    -- Insert text when selecting.
    opts.completion = { list = { selection = { preselect = false, auto_insert = true } } }
    -- opts.keymap = {
    --   preset = "enter",
    --   -- ["<C-y>"] = { "select_and_accept" },
    --   -- Cycle through selections with tab.
    --   ["<Tab>"] = { "select_next", "fallback" },
    --   ["<S-Tab>"] = { "select_prev", "fallback" },
    -- }
  end,
}
