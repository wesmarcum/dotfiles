#!/usr/bin/env zsh

##
# History Settings
#

# Set history file location.
HISTFILE=${XDG_DATA_HOME:=~/.local/share}/zsh/history

# Create the parent directory if it doesn't exist.
[[ -d $HISTFILE:h ]] || mkdir -p $HISTFILE:h

# Max number of entries to keep in history file.
SAVEHIST=$(( 100 * 1000 ))

# Max number of entries to keep in memory.
HISTSIZE=$(( 1.2 * SAVEHIST ))

# Use modern file-locking.
setopt HIST_FCNTL_LOCK

# Record a timestamp of the command.
setopt EXTENDED_HISTORY

# Keep only the most recent copy of each duplicate entry.
setopt HIST_IGNORE_ALL_DUPS

# Show command in history expansion to user before running it
setopt HIST_VERIFY

# Sync history between sessions.
setopt SHARE_HISTORY
