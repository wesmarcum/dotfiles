#!/usr/bin/env zsh

##
# Plugins and themes
#

# zsh built-in plugins
zmodload zsh/complist

# Set default theme.  Read from 'conf/theme', if the file exists.  Default to starship.
if [[ -f "${ZDOTDIR}/conf/theme" ]]; then
    source "${ZDOTDIR}/conf/theme"
else
    theme="starship/starship"
fi

# Define color variables for output.
green='\033[0;32m'
yellow='\033[0;33m'
red='\033[0;31m'
nc='\033[0m'

# Set theme and options.
case $theme in
    "ohmyzsh/ohmyzsh agnoster")
        # hide local user and system name
        DEFAULT_USER=$USER

        eval "znap prompt $theme"
        ;;
    "romkatv/powerlevel10k")
        # The first time you load this theme, it will run a config utility to generate .p10k.zsh.
        # Do NOT write options to .zshrc or use the instant prompt option.
        # To reconfigure this theme, edit .p10k.zsh or run 'p10k configure'.
        eval "znap prompt $theme"

        # load p10k config file
        [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
        ;;
    "spaceship-prompt/spaceship-prompt")
        # set spaceship options
        export SPACESHIP_PROMPT_SEPARATE_LINE=false
        export SPACESHIP_PROMPT_ADD_NEWLINE=false
        export SPACESHIP_DIR_TRUNC_REPO=false

        eval "znap prompt $theme"
        ;;
    "starship/starship")
        # run the install script if starship is not found
        if ! type starship > /dev/null 2>&1; then
            echo -e "${green}[*]${nc} Installing starship..."
            [[ ! -d ${HOME}/.local/bin ]] && mkdir -p ${HOME}/.local/bin
            sh -c "$(curl -fsSL https://starship.rs/install.sh)" -- -b ~/.local/bin -y > /dev/null
            echo -e "${green}[*]${nc} Done"
        fi

        # load starship config file
        export STARSHIP_CONFIG=${ZDOTDIR}/conf/starship

        # equivalent to `eval "$(starship init zsh)"`
        znap eval starship 'starship init zsh --print-full-init'
        ;;
    *)  eval "znap prompt $theme" ;;
esac

# Load lib and plugins from omz.
local -a omz_plugins=(
  lib/{git,theme-and-appearance}
  plugins/ansible
  plugins/colored-man-pages
  plugins/docker-compose
  plugins/git
  plugins/tmux
)

local omz_p=
for omz_p in $omz_plugins; do
    znap source ohmyzsh/ohmyzsh $omz_p
done

# Load main plugins.
local -a plugins=(
    zsh-users/zsh-syntax-highlighting
    zsh-users/zsh-completions
    zsh-users/zsh-autosuggestions
    zsh-users/zsh-history-substring-search
    marlonrichert/zsh-hist
)

# Clone all plugins in parallel.
znap clone $plugins

local p=
for p in $plugins; do
    znap source $p
done

# Load zoxide if installed, fall back to z.
if type zoxide > /dev/null 2>&1; then
    # Equivalent to `eval "$(zoxide init zsh)"`
    znap eval zoxide-shellenv 'zoxide init zsh'
else
    znap source ohmyzsh/ohmyzsh plugins/z
fi
