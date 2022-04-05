#!/usr/bin/env zsh

##
# zshrc
#

# Uncomment the line below and 'zprof' to profile your shell start up time. 
# zmodload zsh/zprof

() {
    # Define location for git repos and data files.
    ZDATADIR="${HOME}/.local/share/zsh"

    # XDG default dirs
    export XDG_CONFIG_HOME=~/.config
    export XDG_CACHE_HOME=~/.cache
    export XDG_DATA_HOME=~/.local/share
    export XDG_RUNTIME_DIR=~/.xdg

    # Doad all files in rc.d that start with number- and end in .zsh
    local file=
    for file in ${ZDOTDIR}/rc.d/<->-*.zsh(n); do
        . $file
    done
} "$@"

# zprof
