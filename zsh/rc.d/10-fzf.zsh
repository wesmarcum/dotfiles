#!/usr/bin/env zsh

##
# fzf
#

# Run only if fzf is installed.
if type fzf > /dev/null 2>&1; then

    # Get fzf version and set required version for integration script.
    ver_fzf=$(fzf --version | cut -d' ' -f1)
    ver_req=0.48.0

    # Check version numbers.
    if [[ "$(printf '%s\n' "${ver_req}" "${ver_fzf}" | sort -V | head -n1)" = "${ver_req}" ]]; then
      # Set up fzf key bindings and fuzzy completion
      # eval "$(fzf --zsh)" 
      znap eval fzf-shellenv 'fzf --zsh'
    else
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
          if [[ -n "${commands[fzf-share]}" ]]; then
          # nix.
          source "$(fzf-share)/key-bindings.zsh"
          source "$(fzf-share)/completion.zsh"
          elif [[ -f ~/.config/fzf/fzf.zsh ]]; then
          # brew.
          source ~/.config/fzf/fzf.zsh
          fi
      fi
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

    # Set layout and theme.
    export FZF_DEFAULT_OPTS='
      --height 50%
      --layout=reverse
      --border=double
      --border-label-pos=10
      --multi
      --marker="|" --pointer=">" --separator="─" --scrollbar="│"
      --color=dark
      --color=fg:-1,bg:-1,hl:#c678dd,fg+:#ffffff,bg+:#4b5263,hl+:#d858fe
      --color=info:#98c379,prompt:#61afef,pointer:#be5046,marker:#e5c07b,spinner:#61afef,header:#61afef
    '
    export FZF_CTRL_T_OPTS="--border-label='| Home Files |'"
    export FZF_CTRL_R_OPTS="--border-label='| History |'"

    # Use preview with 'tree' if available.
    if type tree > /dev/null 2>&1; then
        export FZF_ALT_C_OPTS="--border-label='| Home Directories |' --preview='tree -C {} | head -n 50'"
    else
        export FZF_ALT_C_OPTS="--border-label='| Home Directories |'"
    fi

    # Load fzf functions.
    autoload -Uz fzf-rm
    alias rm="fzf-rm"

fi
