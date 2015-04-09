#!/bin/bash

# only execute brew --prefix once
command -v brew > /dev/null && BREW_PREFIX="$(brew --prefix)"

# Colorize the terminal
export CLICOLOR=1
export LSCOLORS=cxFxCxDxBxegedabagacad

# Set languages
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# fix for bazaar (and possibly other python related packages)
export PYTHONPATH="/usr/local/lib/python2.6/site-packages:$PYTHONPATH"
export PYTHONPATH="/usr/local/lib/python2.7/site-packages:$PYTHONPATH"
export PYTHONPATH="/usr/local/share/google-app-engine:$PYTHONPATH"

# add postgres.app bin to path
export PATH="/Applications/Postgres.app/Contents/Versions/9.4/bin:$PATH"

# add sbin to path for nginx
export PATH="/usr/local/sbin:$PATH"

# add user local user bin to path (since mavericks)
export PATH="/usr/local/bin:$PATH"

# add user bin to path
export PATH="$HOME/bin:$PATH"

# add path to go and go bins to path
export GOPATH="$HOME/.go"
export PATH="$GOPATH/bin:$PATH"

# because of cordova 3.2.0
export JAVA_HOME=$(/usr/libexec/java_home 2> /dev/null)

# use custom .inputrc
export INPUTRC="$HOME/.inputrc"

# a fix for compiling node-canvas
export PKG_CONFIG_PATH="$PKG_CONFIG_PATH:/opt/X11/lib/pkgconfig"

# set haxe std path
export HAXE_STD_PATH="$BREW_PREFIX/lib/haxe/std"

# get docker to work (using boot2docker)
export DOCKER_TLS_VERIFY=1
export DOCKER_CERT_PATH=~/.docker/boot2docker-vm

# enable google cloud sdk
if test -d "/opt/homebrew-cask/Caskroom/google-cloud-sdk/latest/google-cloud-sdk"; then
  source '/opt/homebrew-cask/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.bash.inc'
  source '/opt/homebrew-cask/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.bash.inc'
fi

# We need a bigger file descriptor limit
ulimit -n 10000

# bash completions
test -f "$BREW_PREFIX/etc/bash_completion" && source "$BREW_PREFIX/etc/bash_completion"

# Some usefuls Git aliases
if command -v git > /dev/null; then
  alias gco='git checkout '
  alias gs='git status '
  alias ga='git add '
  alias gb='git branch '
  alias gc='git commit'
  alias gd='git diff'
  alias gx='gitx --all'

  # for bash completion
  if command -v __git_complete > /dev/null; then
    __git_complete gco _git_checkout
    __git_complete gd _git_diff
    __git_complete gc _git_commit
    __git_complete ga _git_add
    __git_complete gs _git_status
    __git_complete gb _git_branch
  fi
fi

# Instead of the obnoxious lime setup
alias lime='haxelib run lime '

# A hack to get subl to work
alias subl='open -a "Sublime Text" '
alias s='subl '

# awscli completion
complete -C aws_completer aws
