#!/bin/bash
# Lazord Bash Theme Configuration
# Add this to your .bashrc

# Lazord colors for Bash
export LAZORD_BG="\033[48;2;0;30;39m"
export LAZORD_FG="\033[38;2;112;130;132m"
export LAZORD_BLUE="\033[38;2;33;118;199m"
export LAZORD_GREEN="\033[38;2;115;138;5m"
export LAZORD_YELLOW="\033[38;2;165;119;6m"
export LAZORD_RED="\033[38;2;209;28;36m"
export LAZORD_PURPLE="\033[38;2;198;28;111m"
export LAZORD_CYAN="\033[38;2;37;146;134m"
export LAZORD_RESET="\033[0m"

# Set LS_COLORS for better file listing
export LS_COLORS="rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:mi=00:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32"

# Custom prompt with Lazord colors
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

export PS1="${LAZORD_BLUE}\u${LAZORD_RESET}@${LAZORD_CYAN}\h${LAZORD_RESET}:${LAZORD_YELLOW}\w${LAZORD_GREEN}\$(parse_git_branch)${LAZORD_RESET}\$ "

# Enable color support
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi