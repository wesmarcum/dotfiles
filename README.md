```
 _______   ______   .___________. _______  __   __       _______     _______.
|       \ /  __  \  |           ||   ____||  | |  |     |   ____|   /       |
|  .--.  |  |  |  | `---|  |----`|  |__   |  | |  |     |  |__     |   (----`
|  |  |  |  |  |  |     |  |     |   __|  |  | |  |     |   __|     \   \    
|  '--'  |  `--'  |     |  |     |  |     |  | |  `----.|  |____.----)   |   
|_______/ \______/      |__|     |__|     |__| |_______||_______|_______/    
                                                                             
``` 

This repo tracks my configuration files for [tmux](https://github.com/tmux/tmux), [vim](https://www.vim.org/)/[neovim](https://neovim.io/), and [zsh](https://www.zsh.org/).  A script (`install.sh`) is provided for easy installation of the tools, recommended packages, and linking files from your home directory.

## Install

```
git clone https://github.com/wesmarcum/dotfiles ~/dotfiles
cd ~/dotfiles
./install.sh
```
The install script will do the following:
* Install curl, git, tmux, vim/neovim, zsh
* Optionally install recommended tools
* Set your default shell to zsh
* Link all files from your home directory to ~/dotfiles

#### Manual

If you would like to manually install packages, use your package manager to install what you need.  You can then link each file manually (e.g. `ln -s ~/dotfiles/zsh/zshenv ~/.zshenv`).

## Configuration

### Alacritty

Alacritty configuration is provided in `~/dotfiles/alacritty/alacritty.toml`. If Alacritty is installed, `install.sh` will link `~/.config/alacritty/alacritty.toml` to the location in `~/dotfiles`. This configuration file will optionally import `~/.config/alacritty/local.toml`. The `local.toml` file can be used to set system specific settings, such as fonts.

_Note:_ Starting with version [v0.13.0](https://github.com/alacritty/alacritty/releases/tag/v0.13.0), Alacritty uses TOML for configuration. YAML configuration is still provided for older versions, but may require manual linking.

### Delta

Delta configuration is located in `~/dotfiles/delta/git-delta`. This package currently requires manual installation. If you wish to use the configuration provided, use an `include` directive in your `.gitconfig`:

```
[include]
    path = ~/dotfiles/delta/git-delta
```
### Neovim

The install script will link `~/.config/nvim` to `~/dotfiles/nvim`. This directory provides configuration files based on [LazyVim](https://www.lazyvim.org/). [OneDark](https://github.com/navarasu/onedark.nvim) is set as the default colorscheme. Configuration files can be found in `~/dotfiles/nvim/lua/config`. The `config` folder sets global options, including keymaps. Plugin options are located in `~/dotfiles/nvim/lua/plugins`.

### tmux

`tmux.conf` sets keybindings to vim for movement and copy/paste.  `C-a` (Ctrl-a) is mapped to the prefix, instead of `C-b`.  Mouse mode is also enabled, so you can resize panes with your mouse.  A simple, light weight status line is set at the bottom.

### Vim

`vimrc` uses [vim-plug](https://github.com/junegunn/vim-plug) to load plugins.  The first time you launch vim, vim-plug will be auto installed.  vim-plug will then automatically download plugins and themes.  You can then use `:PlugStatus` to check the plugin status, `:PlugUpdate` to update plugins, or `:PlugUpgrade` to upgrade vim-plug.  The colorscheme (theme) can be changed with the `:colorscheme` vim command.

Plugins:
- [vim-airline](https://github.com/vim-airline/vim-airline)
- [vimwiki](https://github.com/vimwiki/vimwiki)
- [vim-fugitive](https://github.com/tpope/vim-fugitive)
- [vim-surround](https://github.com/tpope/vim-surround)
- [nerd commenter](https://github.com/preservim/nerdcommenter)
- [markdown browser preview](https://github.com/iamcco/markdown-preview.nvim)
- [fzf.vim](https://github.com/junegunn/fzf.vim)

Color schemes:
- [onedark](https://github.com/joshdick/onedark.vim)
- [nord](https://github.com/arcticicestudio/nord-vim)
- [vim-one](https://github.com/rakr/vim-one)
- [papercolor](https://github.com/NLKNguyen/papercolor-theme)
- [vim-gruvbox8](https://github.com/lifepillar/vim-gruvbox8)
- [breezy](https://github.com/fneu/breezy)
- [material](https://github.com/kaicataldo/material.vim)
- [vim-monokai](https://github.com/crusoexia/vim-monokai)

### zsh

The install script will link `.zshenv` in your home directory to `~/dotfiles/zsh/zshenv`.  The `zshenv` file will set the `$ZDOTDIR` variable to `~/dotfiles/zsh`.  This allows zsh to find `.zshrc` on startup.

`~/dotfiles/zsh/.zshrc` loads files in the `~/dotfiles/zsh/rc.d` directory for a modular configuration:
- 01-hist.zsh (set history file location and options)
- 02-dirs.zsh (directory options and named directories)
- 03-znap.zsh (install/load znap)
- 04-env.zsh (environment variables, set path and fpath)
- 05-plugins.zsh (sets theme options and loads plugins)
- 06-opts.zsh (zsh options, zstyle options)
- 07-keys.zsh (emacs/vi mode, general keybindings)
- 08-commands.zsh (commands, functions, and aliases)
- 09-cursor.zsh (set cursor for viins and vicmd)
- 10-fzf.zsh (fzf options and environment variables)
- 11-bat.zsh (bat options and environment variables)

[znap](https://github.com/marlonrichert/zsh-snap) is utilized for loading and managing plugins.  znap will automatically download and load all plugins the first time you launch zsh.  Plugins can then be updated with `znap pull`.  Check plugin status with `znap status`.

[OMZ](https://github.com/ohmyzsh/ohmyzsh) Plugins:
- [ansible](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/ansible)
- [colored-man-pages](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/colored-man-pages)
- [docker-compose](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/docker-compose)
- [git](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/git)
- [tmux](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/tmux)
- [z](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/z) or [zoxide](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/zoxide)

Plugins:
- [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)
- [zsh-completions](https://github.com/zsh-users/zsh-completions)
- [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)
- [zsh-history-substring-search](https://github.com/zsh-users/zsh-history-substring-search)
- [zsh-hist](https://github.com/marlonrichert/zsh-hist)

The prompt/theme is set in the `~/dotfiles/zsh/conf/theme` file.  If `theme` does not exist, the default theme will be set to agnoster.  To change the theme, just set the `theme` variable to a git repo.  The repo can be in short form (assumed github) or a full URL.  The syntax for OMZ is a little different:  you need to use `ohmyzsh/ohmyzsh <theme>` syntax.  Example `theme` files:

```
theme="starship/starship"
```
```
theme="ohmyzsh/ohmyzsh agnoster"
```

My favorite, and tested, themes:

- [starship/starship](https://github.com/starship/starship)
- [ohmyzsh/ohmyzsh agnoster](https://github.com/ohmyzsh/ohmyzsh/wiki/Themes#agnoster)
- [spaceship-prompt/spaceship-prompt](https://github.com/spaceship-prompt/spaceship-prompt)
- [romkatv/powerlevel10k](https://github.com/romkatv/powerlevel10k)
- [sindresorhus/pure](https://github.com/sindresorhus/pure)
- [ohmyzsh/ohmyzsh gentoo](https://github.com/ohmyzsh/ohmyzsh/wiki/Themes#gentoo)
- [stevelacy/cordial-zsh-theme](https://github.com/stevelacy/cordial-zsh-theme)
- [ohmyzsh/ohmyzsh robbyrussell](https://github.com/ohmyzsh/ohmyzsh/wiki/Themes#robbyrussell)

The `case` statement in `~/dotfiles/zsh/rc.d/05-plugins.zsh` will load different options for some of the themes.  You can modify these options, or insert your own for your favorite theme.

___Note___: `powerlevel10k` has its own configuration stored in `~/.p10k.zsh`.  The first time you load `powerlevel10k`, it will run a configuration utility and generate this file.  When prompted, do **not** write options to `.zshrc`.  I also don't recommend using the "instant prompt" feature - znap has a similar feature.  You can change options for powerlevel10k by running `p10k configure` or by editing `~/.p10k.zsh`.

To use a proxy server, set proxy environment variables in `~/dotfiles/zsh/conf/proxy`.  This file is ignored by git to avoid exposing internal network information.  Example `proxy` file:

```
# set proxy
export http_proxy="http://proxy.local.net:80"
export https_proxy="https://proxy.local.net:80"
```

Other zshrc features:
- vi-ins mode is used by default, switch to vi-cmd with `escape` or `jk`.
- `ctrl + space` to accept autosuggestion.  `alt + t` to toggle suggestions on/off.  You can also use forward word (alt + f) or back word (alt + b) for auto accept.
- Set default editor to neovim or vim.
- Set global aliases.
- Add common dirs to path.
- Autocomplete configuration and custom styling.
- Functions are included in `~/dotfiles/zsh/functions`
- Bat integration.
- fzf / fd integration.

## Recommended Tools

The configuration files are optimized for the following tools:
- [bat](https://github.com/sharkdp/bat)
- [eza](https://github.com/eza-community/eza)
- [fd](https://github.com/sharkdp/fd)
- [fzf](https://github.com/junegunn/fzf)
- [ripgrep](https://github.com/BurntSushi/ripgrep)
- [zoxide](https://github.com/ajeetdsouza/zoxide)

These tools are not required, but can be installed using the `install.sh` script.

## Manual Install

The following packages _may_ require manual install or configuration:
- [alacritty](https://alacritty.org/)
- [delta](https://github.com/dandavison/delta)

Configuration files are provided for these packages and will be linked using `install.sh` if they are installed.
