-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Line wrapping
vim.opt.wrap = true
vim.opt.linebreak = true

-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = false

-- Tabs and indents
vim.opt.tabstop = 8
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.autoindent = true
vim.opt.expandtab = true
vim.opt.smarttab = true

-- Search
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true

-- Undo
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true

-- Better scrolling visibility
vim.opt.scrolloff = 8

-- List characters
vim.opt.listchars = {
  space = ".",
  eol = "$",
  nbsp = "␣",
  trail = "-",
  precedes = "←",
  extends = "→",
  tab = "▸-",
  conceal = "※",
}
vim.opt.list = false

-- Auto complete
vim.opt.completeopt = { "menu", "menuone", "noselect" }

-- Set picker
-- Can be one of: telescope, fzf
-- Leave it to "auto" to automatically use the picker
vim.g.lazyvim_picker = "auto"

-- LazyVim completion engine to use.
-- Can be one of: nvim-cmp, blink.cmp
-- Leave it to "auto" to automatically use the completion engine
-- enabled with `:LazyExtras`
vim.g.lazyvim_cmp = "auto"
