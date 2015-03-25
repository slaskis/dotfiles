#!/bin/bash

# Initialize rbenv
command -v rbenv && eval "$(rbenv init -)"

# Initialize pyenv
command -v pyenv && eval "$(pyenv init -)"

# Initialize pyenv-virtualenv
command -v pyenv-virtualenv-init && eval "$(pyenv virtualenv-init -)"

# import the .bashrc
test -f "$HOME/.bashrc" && . "$HOME/.bashrc"

# command prompt
status(){ [ $? == 0 ] && echo "+" || echo "-"; }
export PS1='\[\033[33m\]$(status)\[\033[00m\] \[\033[32m\]\t\[\033[00m\] \w \[\033[90m\]$(__git_ps1 "(%s)")\[\033[33m\] \n$\[\033[00m\] '

# don't store duplicates in history
export HISTCONTROL=erasedups:ignoredups
