-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Set picker
-- Can be one of: telescope, fzf
-- Leave it to "auto" to automatically use the picker
vim.g.lazyvim_picker = "auto"

-- LazyVim completion engine to use.
-- Can be one of: nvim-cmp, blink.cmp
-- Leave it to "auto" to automatically use the completion engine
-- enabled with `:LazyExtras`
vim.g.lazyvim_cmp = "auto"

local opt = vim.opt

-- Line wrapping
opt.wrap = true
opt.linebreak = true

-- Line numbers
opt.number = true
opt.relativenumber = false

-- Tabs and indents
opt.tabstop = 8
opt.softtabstop = 4
opt.shiftwidth = 4
opt.autoindent = true
opt.expandtab = true
opt.smarttab = true

-- Search
opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true

-- Undo
opt.swapfile = false
opt.backup = false
opt.undofile = true

-- Better scrolling visibility
opt.scrolloff = 8

-- List characters
opt.listchars = {
  space = ".",
  eol = "$",
  nbsp = "␣",
  trail = "-",
  precedes = "←",
  extends = "→",
  tab = "▸-",
  conceal = "※",
}
-- hide list characters by default
opt.list = false

-- Auto complete
opt.completeopt = { "menu", "menuone", "noselect" }

-- Clipboard
-- only set clipboard if not in ssh, to make sure the OSC 52
-- integration works automatically. Requires Neovim >= 0.10.0
opt.clipboard = vim.env.SSH_TTY and "" or "unnamedplus" -- Sync with system clipboard
