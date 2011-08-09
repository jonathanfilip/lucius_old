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
