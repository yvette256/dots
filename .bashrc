#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Add to path
export PATH="$PATH:/home/yvette/bin"

# Set aliases
alias ls='ls --color=auto'
alias scrots='scrot ~/Pictures/Screenshots/%F-%H%M%S_scrot.png'
alias dots='git --git-dir=$HOME/.dots.git/ --work-tree=$HOME'

# Make prompt pretty 
PS1='[\u@\h \W]\$ '
export PS1="\[\033[38;5;87m\]\u\[$(tput sgr0)\]\[\033[38;5;15m\] > \[$(tput sgr0)\]\[\033[38;5;13m\]\w\[$(tput sgr0)\]\[\033[38;5;15m\] > \[$(tput sgr0)\]"

# Powerline
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

# To add support for TTYs this line can be optionally added.
source ~/.cache/wal/colors-tty.sh

