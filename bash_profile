#!/bin/bash

# import the .bashrc
test -f "$HOME/.bashrc" && source "$HOME/.bashrc"

# initialize asdf
test -f "$BREW_PREFIX/opt/asdf/asdf.sh" && source "$BREW_PREFIX/opt/asdf/asdf.sh"

# initialize direnv
command -v direnv > /dev/null && eval "$(direnv hook bash)"

# bash completions
test -f "$BREW_PREFIX/etc/bash_completion" && source "$BREW_PREFIX/etc/bash_completion"

# awscli completion
complete -C aws_completer aws

# command prompt
export PS1='\[\033[33m\]$([ $? == 0 ] && echo "+" || echo "-")\[\033[00m\] \[\033[32m\]\t\[\033[00m\] \w \[\033[90m\]$(command -v __git_ps1 @> /dev/null && __git_ps1 "(%s)")\[\033[33m\] \n$\[\033[00m\] '

# don't store duplicates in history
export HISTCONTROL="erasedups:ignoredups"

# base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/base16-default.dark.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

# silence osx
export BASH_SILENCE_DEPRECATION_WARNING=1