#!/bin/bash

# only execute brew --prefix once
if command -v brew > /dev/null; then
  BREW_PREFIX="$(brew --prefix)"
else
  # make sure we don't set all the paths to root
  BREW_PREFIX="/usr/local"
fi

# Colorize the terminal
export CLICOLOR=1
export LSCOLORS=cxFxCxDxBxegedabagacad

# Set languages
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# add postgres.app bin to path
export PATH="/Applications/Postgres.app/Contents/Versions/9.4/bin:$PATH"

# add sbin to path for nginx
export PATH="$BREW_PREFIX/sbin:$PATH"

# add user local user bin to path (since mavericks)
export PATH="$BREW_PREFIX/bin:$PATH"

# add user bin to path
export PATH="$HOME/bin:$PATH"

# add pyenv bin to path
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

# add path to go and go bins to path
export GOPATH="$HOME/.go"
export PATH="$GOPATH/bin:$PATH"
export PATH="$PATH:$BREW_PREFIX/opt/go/libexec/bin"

# because of cordova 3.2.0
export JAVA_HOME=$(/usr/libexec/java_home 2> /dev/null)

# setup android sdk
export ANDROID_HOME="$BREW_PREFIX/opt/android-sdk"

# use custom .inputrc
export INPUTRC="$HOME/.inputrc"

# a fix for compiling node-canvas
export PKG_CONFIG_PATH="$PKG_CONFIG_PATH:/opt/X11/lib/pkgconfig"

# set haxe std path
export HAXE_STD_PATH="$BREW_PREFIX/lib/haxe/std"

# setup joyent cloud
export JOYENT_CLOUD_USER_NAME="department"
export MANTA_URL="https://us-east.manta.joyent.com"
export MANTA_USER="$JOYENT_CLOUD_USER_NAME"
export MANTA_KEY_ID=$(ssh-keygen -l -f $HOME/.ssh/id_rsa.pub | awk '{print $2}')

# We need a bigger file descriptor limit
ulimit -n 10000

# bash completions
test -f "$BREW_PREFIX/etc/bash_completion" && source "$BREW_PREFIX/etc/bash_completion"

# Some usefuls Git aliases
if command -v git > /dev/null; then
  alias gco='git checkout '
  alias gs='git status '
  alias ga='git add '
  #alias gb='git branch ' # commented out to avoid conflicting with the go tool
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
    #__git_complete gb _git_branch
  fi
fi

# Instead of the obnoxious lime setup
alias lime='haxelib run lime '

# A hack to get subl to work
alias subl='open -a "Sublime Text" '
alias s='subl '

if command -v nvim > /dev/null; then
	alias vim=nvim
	alias vi=nvim
	export VISUAL=nvim
fi

# awscli completion
complete -C aws_completer aws

