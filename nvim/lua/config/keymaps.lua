-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Exit insert mode with jk
vim.keymap.set("i", "jk", "<ESC>", { noremap = true, silent = true, desc = "<ESC>" })

-- <leader>sx to resume telescope search
vim.keymap.set(
  "n",
  "<leader>sx",
  require("telescope.builtin").resume,
  { noremap = true, silent = true, desc = "Resume" }
)

-- <leader>t to toggle 'set list'
vim.keymap.set("n", "<leader>t", ":set list!<CR>", { noremap = true, silent = true, desc = "toggle list" })

-- <leader>yy to copy entire buffer into the system clipboard
vim.api.nvim_set_keymap(
  "n",
  "<leader>yy",
  ':lua vim.api.nvim_command("%y+")<CR>',
  { noremap = true, silent = true, desc = "yank buffer" }
)

-- <leader>dd / <leader>dt to insert date / time
vim.keymap.set("n", "<leader>dd", ':r! date "+\\%m-\\%d-\\%Y" <CR>', { noremap = true, desc = "insert date" })
vim.keymap.set("n", "<leader>dt", ':r! date "+\\%H:\\%M:\\%S" <CR>', { noremap = true, desc = "insert time" })

-- Mimic Emacs line editing in insert mode
vim.keymap.set("i", "<C-A>", "<Home>", { noremap = true })
vim.keymap.set("i", "<C-B>", "<Left>", { noremap = true })
vim.keymap.set("i", "<C-E>", "<End>", { noremap = true })
vim.keymap.set("i", "<C-F>", "<Right>", { noremap = true })
vim.keymap.set("i", "â", "<C-Left>", { noremap = true }) -- <Alt-B>
vim.keymap.set("i", "æ", "<C-Right>", { noremap = true }) -- <Alt-F>
-- vim.keymap.set("i", "<C-K>", "<Esc>lDa", { noremap = true }) -- disabled, lsp keymap conflict
vim.keymap.set("i", "<C-U>", "<Esc>d0xi", { noremap = true })
vim.keymap.set("i", "<C-Y>", "<Esc>Pa", { noremap = true })
vim.keymap.set("i", "<C-X><C-S>", "<Esc>:w<CR>a", { noremap = true })
