#!/usr/bin/env bash

# ls Commands
if [[ $platform == 'linux' ]]; then
    alias ls='ls --color=auto'
    #alias ls='ls --color -F'
elif [[ $platform == 'osx' ]]; then
    alias ls='ls -G'
fi
alias lt='ls -ltr'
alias lta='ls -ltrA'
alias ll='ls -l'
alias lla='ls -lA'

# Navigation
alias up="cd ..; "
alias ..="cd ..; "

# Program shortcuts
alias vi=vim
alias l="less"

# Other Commands
alias psme='ps -Af | grep ${USER}'
alias dfme='df -h | egrep "${USER}|Filesystem"'
alias xterm='xterm -ls' # Always do login shell

