#!/usr/bin/env zsh

##
# fzf
#

# Run only if fzf is installed.
if type fzf > /dev/null 2>&1; then

    # Source key bindings and completions for fzf package.
    if [[ $OSTYPE == linux* || $OSTYPE == freebsd* ]]; then
        # Load keys/completion for Linux/FreeBSD
        if [[ -d /usr/share/doc/fzf/examples ]]; then
            # Debian.
            source /usr/share/doc/fzf/examples/key-bindings.zsh
            source /usr/share/doc/fzf/examples/completion.zsh
        elif [[ -d /usr/local/share/examples/fzf/shell ]]; then
            # FreeBSD.
            source /usr/local/share/examples/fzf/shell/key-bindings.zsh
            source /usr/local/share/examples/fzf/shell/completion.zsh
        elif [[ -d /usr/share/fzf ]]; then
            # Arch.
            source /usr/share/fzf/key-bindings.zsh
            source /usr/share/fzf/completion.zsh
        fi

        # Keys/completion for NixOS.
        if [[ -n "${commands[fzf-share]}" ]]; then
          source "$(fzf-share)/key-bindings.zsh"
          source "$(fzf-share)/completion.zsh"
        fi
    elif [[ $OSTYPE == darwin* ]]; then
        [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
    fi

    # Change the trigger to '++' instead of the default '**'.
    export FZF_COMPLETION_TRIGGER='++'

    # Use fd when available.
    if type fd > /dev/null 2>&1; then
        # Set fd to search in $HOME.
        export FZF_DEFAULT_COMMAND="fd -t f -H --exclude .git . $HOME"
        export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
        export FZF_ALT_C_COMMAND="fd -t d . $HOME"

        # Use fd to list path candidates.
        _fzf_compgen_path() {
            fd --hidden --follow --exclude ".git" . "$1"
        }

        # Use fd to generate the list for directory completion.
        _fzf_compgen_dir() {
            fd --type d --hidden --follow --exclude ".git" . "$1"
        }
    fi

    # Set default fzf options.
    export FZF_DEFAULT_OPTS="--height 40% --layout=reverse --border --multi"

    # Load fzf functions.
    autoload -Uz fzf-rm
    alias rm="fzf-rm"

fi
