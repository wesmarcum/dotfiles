-- nvim-cmp
-- https://github.com/hrsh7th/nvim-cmp
-- This changes the complete confirm key to <tab> instead of <CR>.
-- Disabling auto select of the first item is also desired, but may not be working 100% yet.
-- [[
-- Reference:
-- https://www.lazyvim.org/plugins/coding#nvim-cmp
-- https://www.lazyvim.org/configuration/recipes
-- https://github.com/hrsh7th/nvim-cmp/discussions/1498
-- https://www.reddit.com/r/neovim/comments/19054s4/help_how_do_i_auto_complete_with_tab_in_lazyvim/
-- https://www.reddit.com/r/neovim/comments/156c9nh/how_to_use_tab_to_confirm_first_autocomplete_in/
-- https://github.com/hrsh7th/nvim-cmp/discussions/1411
-- ]]
return {
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-emoji",
    },
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      local has_words_before = function()
        unpack = unpack or table.unpack
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
      end

      local luasnip = require("luasnip")
      local cmp = require("cmp")

      -- Add emoji to completion sources
      table.insert(opts.sources, { name = "emoji" })

      -- TODO: This is intended to disable preselect, but may need some work.
      cmp.setup({
        -- Disable auto select for LSP entries
        preselect = cmp.PreselectMode.None,
        completion = { completeopt = "menu,menuone,noselect" },
      })

      -- Set <Tab> to complete. Use <ctr-n> and <ctr-p> to select.
      opts.mapping = vim.tbl_extend("force", opts.mapping, {
        ["<CR>"] = cmp.config.disable,
        ["<Tab>"] = cmp.mapping.confirm({ select = false }), -- set 'select = true' to auto select the first entry
        ["<Ctr-n>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
          -- this way you will only jump inside the snippet region
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          elseif has_words_before() then
            cmp.complete()
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<Ctr-p>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
      })

      -- return the new table to be used
      return opts
    end,
  },
}
