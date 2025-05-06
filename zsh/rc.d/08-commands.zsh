#!/usr/bin/env zsh

##
# Commands, functions, and aliases
#

# Use eza in place of ls if available.
if command -v eza > /dev/null; then
    alias l='eza -dF'
    alias la='eza -a'
    alias ll='eza -lgB'
    alias lh='eza -lg'
    alias ls='eza'
    alias lsa='eza -lga'
    alias lt='eza -lgT'
    alias lg='eza -lg --git'
# Use exa if eza is not packaged yet.
# Remove this block when eza is available in the debian repo.
elif command -v exa > /dev/null; then
    alias l='exa -dF'
    alias la='exa -a'
    alias ll='exa -lgB'
    alias lh='exa -lg'
    alias ls='exa'
    alias lsa='exa -lga'
    alias lt='exa -lgT'
    alias lg='exa -lg --git'
# ls aliases - Linux.
elif [[ $OSTYPE == linux* ]]; then
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

# zellij
if command -v zellij > /dev/null; then
    alias zj='zellij'
fi

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

# zstats function for command line history frequency analysis.
autoload -Uz zstats
