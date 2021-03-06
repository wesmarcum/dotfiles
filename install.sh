#!/usr/bin/env bash

# Define color variables.
black='\033[0;30m'
red='\033[0;31m'
green='\033[0;32m'
yellow='\033[0;33m'
blue='\033[0;34m'
magenta='\033[0;35m'
cyan='\033[0;36m'
light_gray='\033[0;37m'
white='\033[0;37m'
bold='\033[0;1m'
underline='\033[0;4m'
nc='\033[0m'

# Location for all configuration files.
dotfiles_dir="$HOME/dotfiles"

# Set package lists.
pkg_base="curl git neovim tmux vim zsh"
pkg_freebsd_base="curl git neovim tmux vim-console zsh"
pkg_recommended="bat fd-find fzf ripgrep zoxide"
pkg_brew_recommended="bat fd fzf ripgrep zoxide"

# Set default options.
install_base="y"
install_recommended="y"
zsh_default="y"
neovim_config="y"

# neovim
nvim_config_file=${HOME}/.config/nvim/init.vim
nvim_config_dir=${HOME}/.config/nvim

# Display awesome star wars style banner (https://manytools.org/hacker-tools/ascii-banner/)
clear
printf "${yellow}"
printf " _______   ______   .___________. _______  __   __       _______     _______.\n"
printf "|       \ /  __  \  |           ||   ____||  | |  |     |   ____|   /       |\n"
printf "|  .--.  |  |  |  | \`---|  |----\`|  |__   |  | |  |     |  |__     |   (----\`\n"
printf "|  |  |  |  |  |  |     |  |     |   __|  |  | |  |     |   __|     \   \ \n"
printf "|  \'--\'  |  \`--\'  |     |  |     |  |     |  | |  \`----.|  |____.----)   |\n"
printf "|_______/ \______/      |__|     |__|     |__| |_______||_______|_______/\n"
printf "${nc}"
printf "\n"

# Check uid, exit if root.
if [[ "$(id -u)" = "0" ]]; then
    echo -e "${red}[*]${nc} Error: This script should not be run as root.  Exiting..."
    echo
    exit 1
fi

echo
printf "${yellow}===== Setup =====${nc}\n"
echo

echo -e "${underline}Default settings${nc}"
echo "Install base packages: ${install_base}"
echo "Install recommended tools: ${install_recommended}"
echo "Set zsh to default shell: ${zsh_default}"
echo "Set neovim configuration: ${neovim_config}"
echo
read -rp "Accept defaults? [y/n]: " accept_defaults

if [[ $accept_defaults =~ ^[nN]$ ]]; then
    # Prompt user for options.
    echo
    read -rp "Install base packages? [y/n]: " install_base
    read -rp "Install recommended (optional) tools? [y/n]: " install_recommended
    read -rp "Set zsh as default shell? [y/n]: " zsh_default
    read -rp "Set neovim configuration? [y/n]: " neovim_config
    echo
elif [[ $accept_defaults =~ ^[yY]$ ]]; then
    echo
    echo -e "${green}[*]${nc} Defaults accepted.  Proceeding..."
    echo
else
    echo
    echo -e "${red}[*]${nc} Unknown input: \"${accept_defaults}\".  Exiting..."
    echo
    exit 1
fi

# Install base packages for system.
if [[ $install_base =~ ^[yY]$ ]]; then
    printf "${yellow}===== Install Base Packages =====${nc}\n"
    echo

    if [[ $OSTYPE == linux* ]]; then
        # Check for apt.
        if type apt > /dev/null 2>&1; then
            echo -e "${green}[*]${nc} Installing base packages: ${pkg_base}"
            echo
            sudo apt update && sudo apt install -y ${pkg_base}
        else
            echo -e "${red}[*]${nc} Error: apt not found, unable to install base packages."
        fi
    elif [[ $OSTYPE == freebsd* ]]; then
        if type pkg > /dev/null 2>&1; then
            echo -e "${green}[*]${nc} Installing base packages: ${pkg_freebsd_base}"
            echo
            sudo pkg update && sudo pkg install -y ${pkg_freebsd_base}
        else
            echo -e "${red}[*]${nc} Error: pkg not found, unable to install base packages."
        fi
    elif [[ $OSTYPE == darwin* ]]; then
        if type brew > /dev/null 2>&1; then
            echo -e "${green}[*]${nc} Installing base packages: ${pkg_base}"
            echo
            brew install ${pkg_base}
        else
            echo -e "${red}[*]${nc} Error: brew not found, unable to install base packages."
        fi
    else
        echo -e "${red}[*]${nc} Error: System not supported."
        exit 1
    fi
fi

# Install recommended (optional) packages.
if [[ $install_recommended =~ ^[yY]$ ]]; then
    echo
    printf "${yellow}===== Install Recommended Packages =====${nc}\n"
    echo

    if [[ $OSTYPE == linux* ]]; then
        # Check for apt.
        if type apt > /dev/null 2>&1; then
            echo -e "${green}[*]${nc} Installing recommended packages: ${pkg_recommended}"
            echo
            sudo apt update && sudo apt install -y ${pkg_recommended}
        else
            echo -e "${red}[*]${nc} Error: apt not found, unable to install recommended packages."
        fi
    elif [[ $OSTYPE == freebsd* ]]; then
        if type pkg > /dev/null 2>&1; then
            echo -e "${green}[*]${nc} Installing recommended packages: ${pkg_recommended}"
            echo
            sudo pkg update && sudo pkg install -y ${pkg_recommended}
        else
            echo -e "${red}[*]${nc} Error: pkg not found, unable to install recommended packages."
        fi
    elif [[ $OSTYPE == darwin* ]]; then
        if type brew > /dev/null 2>&1; then
            echo -e "${green}[*]${nc} Installing recommended packages: ${pkg_brew_recommended}"
            echo
            brew install ${pkg_brew_recommended}
        else
            echo -e "${red}[*]${nc} Error: brew not found, unable to install recommended packages."
        fi
    else
        echo -e "${red}[*]${nc} Error: System not supported."
        exit 1
    fi
fi

# Set zsh to default.
if [[ $zsh_default =~ ^[yY]$ ]]; then
    echo
    printf "${yellow}===== Set zsh to Default Shell =====${nc}\n"
    echo
    chsh -s $(which zsh)
fi

# Set neovim configuration.
if [[ $neovim_config =~ ^[yY]$ ]]; then
    mkdir -p "${nvim_config_dir}"
    echo
    printf "${yellow}===== Set Neovim Configuration =====${nc}\n"
    echo
    echo "\" set by dotfiles install.sh" > "${nvim_config_file}"
    echo "source ~/.vimrc" >> "${nvim_config_file}"
    echo -e "${green}[*]${nc} Neovim configuration written to ${nvim_config_file}"
fi

# Array for files to link.
declare -a dotfiles
dotfiles=(
    zsh/zshenv
    vim/vimrc
    tmux/tmux.conf
)
declare -r dotfiles

echo
printf "${yellow}===== Link Files =====${nc}\n"
echo

for file in ${dotfiles[@]}; do
    echo -e "${green}[*]${nc} Linking ${file##*/}"
    ln -sf "${dotfiles_dir}/${file}" "$HOME/.${file##*/}"
done

echo
echo -e "${green}[*]${nc} Done"
echo
