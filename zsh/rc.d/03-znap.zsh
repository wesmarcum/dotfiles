#!/usr/bin/env zsh

##
# Znap plugin manager
#

# Clone the znap repo if not found.
if [[ ! -f "${ZDATADIR}/zsh-snap/znap.zsh" ]]; then
    mkdir -p "${ZDATADIR}/plugins"
    mkdir -p "${ZDATADIR}/zsh-snap"

    # Check for git.
    if type git > /dev/null 2>&1; then
        git clone -q https://github.com/marlonrichert/zsh-snap.git "${ZDATADIR}/zsh-snap"
    else
        echo "Error: git not found; unable to install znap"
    fi
fi

# Set znap plugin dir and load znap.
zstyle ':znap:*' plugins-dir "${ZDATADIR}/plugins"
source "${ZDATADIR}/zsh-snap/znap.zsh"
