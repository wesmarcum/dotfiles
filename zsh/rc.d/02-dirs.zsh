#!/usr/bin/env zsh

##
# Named directories and options
#

# Directory shortcuts.  These can be referenced with ~<name>.
hash -d zdot=$ZDOTDIR
hash -d zdata=$ZDATADIR

# Directory history size
DIRSTACKSIZE=8

# Auto push dirs when using `cd`.
setopt autopushd pushdminus pushdsilent pushdtohome

# Change dirs without `cd`.  Type the dir and press enter.
setopt AUTO_CD
