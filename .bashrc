#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Add my bin to path
export PATH="$PATH:/home/yvette/bin:/home/yvette/.gem/ruby/2.5.0/bin:/home/yvette/.local/bin"

# Set my aliases
alias ls='ls --color=auto'
alias scrots='scrot ~/pictures/screenshots/%F-%H%M%S_scrot.png'
alias dots='git --git-dir=$HOME/.dots.git/ --work-tree=$HOME'

rice() {
    wpg -s "$@"
    wal -R
    wal-set
}

# Set powerline shell prompt
function _update_ps1() {
    PS1=$(powerline-shell $?)
}

if [[ $TERM != linux && ! $PROMPT_COMMAND =~ _update_ps1 ]]; then
    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi

# Import colorscheme from 'wal' asynchronously
# &   # Run the process in the background.
# ( ) # Hide shell job control messages.
(cat ~/.cache/wal/sequences &)

# Add support for TTYs
source ~/.cache/wal/colors-tty.sh

# opam Configuration
test -r /home/yvette/.opam/opam-init/init.sh && . /home/yvette/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true

