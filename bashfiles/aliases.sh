#!/usr/bin/env bash

alias lt='ls -ltrF'
alias lta='ls -ltrAF'
alias ll='ls -lF'
alias lsl='ls -lF'
alias lla='ls -lAF'

if [[ $platform == 'linux' ]]; then
    alias ls='ls --color=auto'
    #alias ls='ls --color -F'
elif [[ $platform == 'osx' ]]; then
    alias ls='ls -G'
fi

