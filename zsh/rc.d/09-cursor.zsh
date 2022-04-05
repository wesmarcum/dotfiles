#!/usr/bin/env zsh

##
# Set cursor for viins and vicmd.
#

cursor_mode() {
    # See https://ttssh2.osdn.jp/manual/4/en/usage/tips/vim.html for cursors
    block_blink='\e[1 q'
    block_solid='\e[2 q'
    underline_blink='\e[3 q'
    underline_solid='\e[4 q'
    beam_blink='\e[5 q'
    beam_solid='\e[6 q'

    cursor_vicmd=${block_solid}
    cursor_viins=${beam_solid}

    function zle-keymap-select {
        if [[ ${KEYMAP} == vicmd ]] ||
            [[ $1 = 'block' ]]; then
            echo -ne $cursor_vicmd
            zle reset-prompt
        elif [[ ${KEYMAP} == main ]] ||
            [[ ${KEYMAP} == viins ]] ||
            [[ ${KEYMAP} = '' ]] ||
            [[ $1 = 'beam' ]]; then
            echo -ne $cursor_viins
            zle reset-prompt
        fi
    }

    zle-line-init() {
        echo -ne $cursor_viins
    }

# If you have a problem with End and Home key
#    zle-line-init () {
#       # Default zle-line-init
#       if (( $+terminfo[smkx] ))
#       then
#               echoti smkx
#       fi
#       zle editor-info
#
#       # Modify cursor!
#       zle -K viins
#   }

    zle -N zle-keymap-select
    zle -N zle-line-init
}

cursor_mode
