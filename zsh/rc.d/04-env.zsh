#!/usr/bin/env zsh

##
# Environment variables and default programs.
#

# Set default editor & pager.
if type nvim > /dev/null 2>&1; then
    export VISUAL=nvim
else
    export VISUAL=vim
fi
export EDITOR="$VISUAL"
export PAGER=less

# Set umask.
umask 0027

# Set proxy if conf/proxy exists.
[[ -f "${ZDOTDIR}/conf/proxy" ]] && source "${ZDOTDIR}/conf/proxy"

# Set default URI for kvm/libvirt - defaults to qemu:///session if not defined
export LIBVIRT_DEFAULT_URI="qemu:///system"

#
# Plugins
#

# Set data dir for zoxide.
export _ZO_DATA_DIR=${XDG_DATA_HOME:=~/.local/share}/zoxide

# Change fg color for zsh-autosuggestions.
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=59'

# Disable auto-format for zsh-history.
zstyle ':hist:*' auto-format no

#
# Path / fpath
#

# Set paths.  -U discards duplicates.  -T creates a "tied" pair.
export -U PATH path FPATH fpath MANPATH manpath
export -UT INFOPATH infopath

# (N) - null if file doesn't exist.
path=(
    $path
    /sbin
    /usr/sbin
    ~/.local/bin(N)
    ~/bin(N)
    # snapd
    /snap/bin(N)
    # adb
    ~/adb-fastboot/platform-tools(N)
    # brew
    /home/linuxbrew/.linuxbrew/bin(N)
    /opt/homebrew/bin(N)
    # rust
    ~/.cargo/bin(N)
    /usr/lib/cargo/bin(N)
)

fpath=(
    $ZDOTDIR/functions
    $fpath
    ~/.local/share/zsh/site-functions
)

#
# Homebrew
#

if command -v brew > /dev/null; then
    # `eval "$( brew shellenv )"`
    znap eval brew-shellenv 'brew shellenv'

    # Include completions for brew.
    fpath+=( $HOMEBREW_PREFIX/share/zsh/site-functions )
fi

#
# Nix
#

# Nix package manager
if [[ -e /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh ]]; then
    # Multi user.
    source /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh
elif [[ -e ~/.nix-profile/etc/profile.d/nix.sh ]]; then
    # Single user.
    source ~/.nix-profile/etc/profile.d/nix.sh
fi

# Nix home-manager
if [[ -e ~/.nix-profile/etc/profile.d/hm-session-vars.sh ]]; then
    # User packages (default).
    source ~/.nix-profile/etc/profile.d/hm-session-vars.sh
elif [[ -e "/etc/profiles/per-user/${USER}/etc/profile.d/hm-session-vars.sh" ]]; then
    # Global packages.
    source "/etc/profiles/per-user/${USER}/etc/profile.d/hm-session-vars.sh"
fi

# Add ~/.nix-profile/share to XDG_DATA_DIRS for desktop apps.
if type nix > /dev/null 2>&1; then
   export XDG_DATA_DIRS="${HOME}/.nix-profile/share:${XDG_DATA_DIRS}"
fi
