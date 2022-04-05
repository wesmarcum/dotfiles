#!/usr/bin/env zsh

##
# Key bindings
#

#
# Map escape sequences.  This way we don't have to check for the terminal running
# in "application" mode.  The `-s` flag to bindkey binds a string or sequence.
#
# Ref: https://github.com/Phantas0s/.dotfiles/blob/master/zsh/bindings.zsh
#      https://www.reddit.com/r/zsh/comments/eblqvq/del_pgup_and_pgdown_input_in_terminal/fb7337q/
#

# If numlock is off, translate keys to appear the same as with numlock on.
bindkey -s '^[OM'    '^M'           # enter
bindkey -s '^[Ok'    '+'
bindkey -s '^[Om'    '-'
bindkey -s '^[Oj'    '*'
bindkey -s '^[Oo'    '/'
bindkey -s '^[OX'    '='

# If the terminal is switched to application mode (smkx), translate keys to make them
# appear the same as in raw mode (rmkx).
bindkey -s '^[OA'    '^[[A'         # up
bindkey -s '^[OB'    '^[[B'         # down
bindkey -s '^[OD'    '^[[D'         # left
bindkey -s '^[OC'    '^[[C'         # right
bindkey -s '^[OH'    '^[[H'         # home
bindkey -s '^[OF'    '^[[F'         # end

# TTY sends different key codes.  Translate them to regular.
bindkey -s '^[[1~'   '^[[H'         # home
bindkey -s '^[[7~'   '^[[H'         # home
bindkey -s '^[[4~'   '^[[F'         # end
bindkey -s '^[[8~'   '^[[F'         # end
bindkey -s '^[[3\^'  '^[[3;5~'
bindkey -s '^[^[[3~' '^[[3;3~'
bindkey -s '^[[1;9C' '^[[1;3C'
bindkey -s '^[^[[C'  '^[[1;3C'
bindkey -s '^[[1;9D' '^[[1;3D'
bindkey -s '^[^[[D'  '^[[1;3D'
bindkey -s '^[Od'    '^[[1;5D'
bindkey -s '^[Oc'    '^[[1;5C'

# Build hash/associative array for keybindings.
typeset -grA keys=(
    Up                   '^[[A'
    Down                 '^[[B'
    Right                '^[[C'
    Left                 '^[[D'
    Home                 '^[[H'
    End                  '^[[F'
    Insert               '^[[2~'
    Delete               '^[[3~'
    PageUp               '^[[5~'
    PageDown             '^[[6~'
    Backspace            '^?'

    Shift+Up             '^[[1;2A'
    Shift+Down           '^[[1;2B'
    Shift+Right          '^[[1;2C'
    Shift+Left           '^[[1;2D'
    Shift+Home           '^[[1;2H'
    Shift+End            '^[[1;2F'
    Shift+Insert         '^[[2;2~'
    Shift+Delete         '^[[3;2~'
    Shift+PageUp         '^[[5;2~'
    Shift+PageDown       '^[[6;2~'
    Shift+Backspace      '^?'
    Shift+Tab            '^[[Z'

    Alt+Up               '^[[1;3A'
    Alt+Down             '^[[1;3B'
    Alt+Right            '^[[1;3C'
    Alt+Left             '^[[1;3D'
    Alt+Home             '^[[1;3H'
    Alt+End              '^[[1;3F'
    Alt+Insert           '^[[2;3~'
    Alt+Delete           '^[[3;3~'
    Alt+PageUp           '^[[5;3~'
    Alt+PageDown         '^[[6;3~'
    Alt+Backspace        '^[^?'

    Alt+Shift+Up         '^[[1;4A'
    Alt+Shift+Down       '^[[1;4B'
    Alt+Shift+Right      '^[[1;4C'
    Alt+Shift+Left       '^[[1;4D'
    Alt+Shift+Home       '^[[1;4H'
    Alt+Shift+End        '^[[1;4F'
    Alt+Shift+Insert     '^[[2;4~'
    Alt+Shift+Delete     '^[[3;4~'
    Alt+Shift+PageUp     '^[[5;4~'
    Alt+Shift+PageDown   '^[[6;4~'
    Alt+Shift+Backspace  '^[^H'

    Ctrl+Up              '^[[1;5A'
    Ctrl+Down            '^[[1;5B'
    Ctrl+Right           '^[[1;5C'
    Ctrl+Left            '^[[1;5D'
    Ctrl+Home            '^[[1;5H'
    Ctrl+End             '^[[1;5F'
    Ctrl+Insert          '^[[2;5~'
    Ctrl+Delete          '^[[3;5~'
    Ctrl+PageUp          '^[[5;5~'
    Ctrl+PageDown        '^[[6;5~'
    Ctrl+Backspace       '^H'

    Ctrl+Shift+Up        '^[[1;6A'
    Ctrl+Shift+Down      '^[[1;6B'
    Ctrl+Shift+Right     '^[[1;6C'
    Ctrl+Shift+Left      '^[[1;6D'
    Ctrl+Shift+Home      '^[[1;6H'
    Ctrl+Shift+End       '^[[1;6F'
    Ctrl+Shift+Insert    '^[[2;6~'
    Ctrl+Shift+Delete    '^[[3;6~'
    Ctrl+Shift+PageUp    '^[[5;6~'
    Ctrl+Shift+PageDown  '^[[6;6~'
    Ctrl+Shift+Backspace '^?'

    Ctrl+Alt+Up          '^[[1;7A'
    Ctrl+Alt+Down        '^[[1;7B'
    Ctrl+Alt+Right       '^[[1;7C'
    Ctrl+Alt+Left        '^[[1;7D'
    Ctrl+Alt+Home        '^[[1;7H'
    Ctrl+Alt+End         '^[[1;7F'
    Ctrl+Alt+Insert      '^[[2;7~'
    Ctrl+Alt+Delete      '^[[3;7~'
    Ctrl+Alt+PageUp      '^[[5;7~'
    Ctrl+Alt+PageDown    '^[[6;7~'
    Ctrl+Alt+Backspace   '^[^H'

    Ctrl+Alt+Shift+Up        '^[[1;8A'
    Ctrl+Alt+Shift+Down      '^[[1;8B'
    Ctrl+Alt+Shift+Right     '^[[1;8C'
    Ctrl+Alt+Shift+Left      '^[[1;8D'
    Ctrl+Alt+Shift+Home      '^[[1;8H'
    Ctrl+Alt+Shift+End       '^[[1;8F'
    Ctrl+Alt+Shift+Insert    '^[[2;8~'
    Ctrl+Alt+Shift+Delete    '^[[3;8~'
    Ctrl+Alt+Shift+PageUp    '^[[5;8~'
    Ctrl+Alt+Shift+PageDown  '^[[6;8~'
    Ctrl+Alt+Shift+Backspace '^?'
)

# Use vi insert mode by default.
bindkey -v

# Switch to vi-cmd mode with ESC or 'jk'.
bindkey '\e' vi-cmd-mode
bindkey 'jk' vi-cmd-mode

# Set mode switch timeout in ms.
export KEYTIMEOUT=10

# Autosuggest.
bindkey '^@' autosuggest-accept     # ctrl + space
bindkey '^[t' autosuggest-toggle    # ctrl + alt + t

# History substring search.
bindkey -M viins '^P' history-substring-search-up
bindkey -M viins '^N' history-substring-search-down

bindkey -M vicmd '^P' history-substring-search-up
bindkey -M vicmd '^N' history-substring-search-down

# Remove history search for j and k.
bindkey -M vicmd "k" up-line
bindkey -M vicmd "j" down-line

# Use vim keys for completion menu select.
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'l' vi-forward-char

# Movement bindings.
bindkey -- "${keys[Home]}"            beginning-of-line
bindkey -- "${keys[End]}"             end-of-line
bindkey -- "${keys[Insert]}"          overwrite-mode
bindkey -- "${keys[Backspace]}"       backward-delete-char
bindkey -- "${keys[Delete]}"          delete-char
bindkey -- "${keys[Up]}"              up-line-or-history
bindkey -- "${keys[Down]}"            down-line-or-history
bindkey -- "${keys[Left]}"            backward-char
bindkey -- "${keys[Right]}"           forward-char
bindkey -- "${keys[PageUp]}"          beginning-of-buffer-or-history
bindkey -- "${keys[PageDown]}"        end-of-buffer-or-history
bindkey -- "${keys[Shift+Tab]}"       reverse-menu-complete
bindkey -- "${keys[Ctrl+Left]}"       backward-word
bindkey -- "${keys[Ctrl+Right]}"      forward-word
bindkey -- "${keys[Ctrl+Backspace]}"  backward-kill-word

# Add emacs-like bindings.
bindkey -M viins '^a'    beginning-of-line
bindkey -M viins '^e'    end-of-line
bindkey -M viins '^k'    kill-line
bindkey -M viins '^y'    yank
bindkey -M viins '^w'    backward-kill-word
bindkey -M viins '^u'    backward-kill-line
bindkey -M viins '^h'    backward-delete-char
bindkey -M viins '^?'    backward-delete-char
bindkey -M viins '^_'    undo
bindkey -M viins '\ef'   forward-word
bindkey -M viins '\eb'   backward-word
bindkey -M viins '\ed'   kill-word

# Alt-h to show help for current command.
bindkey -M viins '^[h'   run-help

# Alt-. to copy the argument from the previous command.
bindkey -M viins '^[.'   insert-last-word

# Use z_helper widget for zoxide tab complete.
bindkey -M viins '^[[0n' _z_helper

# Alt-return to insert a newline without accepting the command.
bindkey -M viins '^[^M' self-insert-unmeta

# Use Ctrl-a to increment argument.
autoload -Uz incarg
zle -N incarg
bindkey -M vicmd '^a' incarg

# Edit command lines in $EDITOR with Alt-v.
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey -M vicmd '^[v' edit-command-line

# Add text objects.
autoload -Uz select-bracketed select-quoted
zle -N select-quoted
zle -N select-bracketed
for km in viopp visual; do
  bindkey -M $km -- '-' vi-up-line-or-history
  for c in {a,i}${(s..)^:-\'\"\`\|,./:;=+@}; do
    bindkey -M $km $c select-quoted
  done
  for c in {a,i}${(s..)^:-'()[]{}<>bB'}; do
    bindkey -M $km $c select-bracketed
  done
done

# Add surround support.
# Not compatible with syntax-highlighting.
# autoload -Uz surround
# zle -N delete-surround surround
# zle -N add-surround surround
# zle -N change-surround surround
# bindkey -M vicmd cs change-surround
# bindkey -M vicmd ds delete-surround
# bindkey -M vicmd ys add-surround
# bindkey -M visual S add-surround

#
# Ref: https://github.com/marlonrichert/zsh-launchpad/blob/main/.config/zsh/rc.d/08-keys.zsh
#

# Alt-H: Get help on your current command.
() {
  unalias $1 2> /dev/null   # Remove the default.

  # Load the more advanced version.
  # -R resolves the function immediately, so we can access the source dir.
  autoload -UzR $1

  # Load the hash table that maps each function to its source file.
  zmodload -F zsh/parameter p:functions_source

  # Lazy-load all the run-help-* helper functions from the same dir.
  autoload -Uz $functions_source[$1]-*~*.zwc  # Exclude .zwc files.
} run-help

# Alt-Q
# - On the main prompt: Push aside your current command line  so you can type a
#   new one. The old command line is restored when you press Alt-G or once
#   you've accepted the new command line.
# - On the continuation prompt: Return to the main prompt.
bindkey '^[q' push-line-or-edit
bindkey '^[g' get-line

# Alt-V: Show the next key combo's terminal code and state what it does.
bindkey '^[v' describe-key-briefly

# Alt-Shift-S: Prefix the current or previous command line with `sudo`.
() {
  bindkey '^[S' $1  # Bind Alt-Shift-S to the widget below.
  zle -N $1         # Create a widget that calls the function below.
  $1() {            # Create the function.
    [[ -z $BUFFER ]] && zle .up-history
    LBUFFER="sudo $LBUFFER"   # Use $LBUFFER to preserve cursor position.
  }
} .sudo
