-- vimwiki
-- https://github.com/vimwiki/vimwiki
return {
  "vimwiki/vimwiki",
  lazy = false,
  init = function()
    vim.g.vimwiki_global_ext = 0
    vim.g.vimwiki_list = {
      { path = "$HOME/notes", syntax = "markdown", ext = ".md" },
    }
    vim.g.vimwiki_dir_link = "index"
    vim.g.vimwiki_ext2syntax = {
      [".md"] = "markdown",
      [".markdown"] = "markdown",
      [".mdown"] = "markdown",
    }
  end,
}
