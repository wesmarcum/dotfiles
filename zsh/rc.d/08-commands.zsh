#!/usr/bin/env zsh

##
# Commands, functions, and aliases
#

# ls aliases - Linux.
if [[ $OSTYPE == linux* ]]; then
    alias l='ls -dF'
    alias la='ls -A'
    alias ll='ls -l'
    alias lh='ls -lh'
    alias ls='ls --color=auto'
    alias lsa='ls -lah'
# ls aliases - macos / FreeBSD.
elif [[ $OSTYPE == darwin* || $OSTYPE == freebsd* ]]; then
    alias l='ls -dF'
    alias la='ls -AG'
    alias ll='ls -lG'
    alias lh='ls -lhG'
    alias ls='ls -G'
    alias lsa='ls -lahG'
fi

# dir history.
alias dh='dirs -v'

# neovim
alias nv='nvim'

# less - output color codes.
alias less='less -r'

# Grep (add color output).
alias grep='grep --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn,.idea,.tox}'
alias egrep='egrep --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn,.idea,.tox}'
alias fgrep='fgrep --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn,.idea,.tox}'

# zsh startup benchmark.
alias zbench='for i in $(seq 10); do; time zsh -lic exit; done'

# fixssh - updates SSH_AUTH_SOCK for tmux sessions.
alias fixssh='eval $(tmux showenv -s SSH_AUTH_SOCK)'

# Associate file .extensions with programs.
alias -s {css,gradle,html,js,json,md,patch,properties,txt,xml,yml,yaml}=$EDITOR
alias -s gz='gzip -l'
alias -s {log,out}='tail -F'

# Use `< file` to quickly view the contents of any file.
READNULLCMD=$EDITOR

# zmv lets you batch rename (or copy or link) files by using pattern matching.
# https://zsh.sourceforge.io/Doc/Release/User-Contributions.html#index-zmv
autoload -Uz zmv
alias zmv='zmv -Mv'
alias zcp='zmv -Cv'
alias zln='zmv -Lv'

# Weather function for wttr.in forecast.
autoload -Uz weather
