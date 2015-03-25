#!/bin/bash

# initialize rbenv
command -v rbenv > /dev/null && eval "$(rbenv init --no-rehash -)"

# initialize pyenv
command -v pyenv > /dev/null && eval "$(pyenv init -)"

# initialize pyenv-virtualenv
command -v pyenv-virtualenv-init > /dev/null && eval "$(pyenv virtualenv-init -)"

# initialize boot2docker
command -v boot2docker > /dev/null && eval "$(boot2docker shellinit 2>/dev/null | grep export)"

# initialize nvm
test -f "$HOME/.nvm/nvm.sh" && source "$HOME/.nvm/nvm.sh"

# import the .bashrc
test -f "$HOME/.bashrc" && source "$HOME/.bashrc"

# command prompt
status(){ [ $? == 0 ] && echo "+" || echo "-"; }
export PS1='\[\033[33m\]$(status)\[\033[00m\] \[\033[32m\]\t\[\033[00m\] \w \[\033[90m\]$(__git_ps1 "(%s)")\[\033[33m\] \n$\[\033[00m\] '

# don't store duplicates in history
export HISTCONTROL=erasedups:ignoredups

# base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/base16-default.dark.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL