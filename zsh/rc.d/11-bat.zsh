#!/usr/bin/env zsh

##
# bat
#

# Only run if bat is installed.
if type bat > /dev/null 2>&1 || type batcat > /dev/null 2>&1; then

    # Set link for Debian/Ubuntu.
    if type batcat > /dev/null 2>&1; then
        if [[ ! -L ~/.local/bin/bat ]]; then
            mkdir -p ~/.local/bin
            ln -s $(command -v batcat) ~/.local/bin/bat
        fi
    fi

    # Set theme.
    export BAT_THEME="OneHalfDark"

    # Alias cat to bat, turn off paging.
    alias cat='bat --paging=never --style=plain'

    # Use bat for manpager.
    # export MANPAGER="sh -c 'col -bx | bat -l man -p'"
fi
