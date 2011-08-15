#!/usr/bin/env bash

platform=$(uname)
if [[ "$platform" == 'Linux' ]]; then
    platform='linux'
elif [[ "$platform" == 'Darwin' ]]; then
    platform='osx'
else
    platform='unknown'
fi


# Options
shopt -s cdspell # Correct minor cd spelling errors
shopt -s dotglob # Allow dot files to be returned in path expansion
#set -o vi # Make the prompt like vi


# Settings
export EDITOR=vim
export VISUAL=vim
export IGNOREEOF=1 # press ctrl+D twice to exit
export PROMPT_COMMAND=bash_prompt # Set up the command line
export GREP_OPTIONS="--exclude=\*.svn\*"


function bash_prompt()
{
    local NONE="\[\033[0m\]"

    local K="\[\033[0;30m\]"    # black
    local R="\[\033[0;31m\]"    # red
    local G="\[\033[0;32m\]"    # green
    local Y="\[\033[0;33m\]"    # yellow
    local B="\[\033[0;34m\]"    # blue
    local M="\[\033[0;35m\]"    # magenta
    local C="\[\033[0;36m\]"    # cyan
    local W="\[\033[0;37m\]"    # white

    # empahsized (bolded) colors
    local EMK="\[\033[1;30m\]"    # black  
    local EMR="\[\033[1;31m\]"    # red    
    local EMG="\[\033[1;32m\]"    # green  
    local EMY="\[\033[1;33m\]"    # yellow 
    local EMB="\[\033[1;34m\]"    # blue   
    local EMM="\[\033[1;35m\]"    # magenta
    local EMC="\[\033[1;36m\]"    # cyan   
    local EMW="\[\033[1;37m\]"    # white  

    # background colors
    local BGK="\[\033[40m\]"    # black  
    local BGR="\[\033[41m\]"    # red    
    local BGG="\[\033[42m\]"    # green  
    local BGY="\[\033[43m\]"    # yellow 
    local BGB="\[\033[44m\]"    # blue   
    local BGM="\[\033[45m\]"    # magenta
    local BGC="\[\033[46m\]"    # cyan   
    local BGW="\[\033[47m\]"    # white  

    if [ "${SHELL_TAG}" ]; then
        PS1="  ${EMK}[${NONE}${Y}${SHELL_TAG}${NONE}${EMK}]${NONE} ${EMK}[${NONE}${C}\u@\h${NONE}${EMK}]${NONE} ${G}\w${NONE}\n> "
    else
        PS1="  ${EMK}[${NONE}${C}\u@\h${NONE}${EMK}]${NONE} ${G}\w${NONE}\n> "
    fi

    if [ "${TITLE}" ]; then
        echo -ne "\033]0;${TITLE} - ${HOSTNAME}\007"
    else
        echo -ne "\033]0;${HOSTNAME}\007"
    fi
}

set umask 0002

