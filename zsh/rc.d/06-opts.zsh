#!/usr/bin/env zsh

##
# Shell options
#

# Enable extended globbing.
setopt EXTENDED_GLOB

# Sort numbers numerically, not lexicographically.
setopt NUMERIC_GLOB_SORT

# Don't treat non-executable files in $path as commands.
setopt HASH_EXECUTABLES_ONLY

# Allow comments to be pasted into the command line.
setopt INTERACTIVE_COMMENTS

# Don't let > overwrite files (use >| instead).
setopt NO_CLOBBER

# Enable menu complete.
setopt MENU_COMPLETE

# Auto list choices on ambiguous completion.
setopt AUTO_LIST

# Complete from both ends of a word
setopt COMPLETE_IN_WORD

#
# Completion options
#
# Ref: https://github.com/Phantas0s/.dotfiles/blob/master/zsh/completion.zsh
#

# Define completers.
zstyle ':completion:*' completer _extensions _complete _approximate

# Use cache for commands using cache.
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "$XDG_CACHE_HOME/zsh/compcache"

# Complete the alias when _expand_alias is used as a function.
zstyle ':completion:*' complete true

# Select in a menu.
zstyle ':completion:*' menu select

# Autocomplete options for cd instead of directory stack
zstyle ':completion:*' complete-options true

# Colors for files and directory
zstyle ':completion:*:*:*:*:default' list-colors ${(s.:.)LSCOLORS}
zstyle ':completion:*:*:*:*:corrections' format '%F{yellow}!- %d (errors: %e) -!%f'
zstyle ':completion:*:*:*:*:descriptions' format '%F{blue}--%D %d --%f'
zstyle ':completion:*:*:*:*:messages' format ' %F{purple} -- %d --%f'
zstyle ':completion:*:*:*:*:warnings' format ' %F{red}-- no matches found --%f'

# Required for completion to be in good groups (named after the tags)
zstyle ':completion:*' group-name ''
zstyle ':completion:*:*:-command-:*:*' group-order aliases builtins functions commands

# See ZSHCOMPWID "completion matching control"
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' keep-prefix true
zstyle -e ':completion:*:(ssh|scp|sftp|rsh|rsync):hosts' hosts 'reply=(${=${${(f)"$(cat {/etc/ssh_,~/.ssh/known_}hosts(|2)(N) /dev/null)"}%%[# ]*}//,/ })'
