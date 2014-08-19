# Colorize the terminal
export CLICOLOR=1
export LSCOLORS=cxFxCxDxBxegedabagacad

# Set languages
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# fix for bazaar (and possibly other python related packages)
export PYTHONPATH="/usr/local/lib/python2.6/site-packages:$PYTHONPATH"
export PYTHONPATH="/usr/local/lib/python2.7/site-packages:$PYTHONPATH"

# add postgres.app bin to path
export PATH="/Applications/Postgres93.app/Contents/MacOS/bin:$PATH"

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
export JAVA_HOME=$(/usr/libexec/java_home)

# use custom .inputrc
export INPUTRC="$HOME/.inputrc"

# a fix for compiling node-canvas
export PKG_CONFIG_PATH="$PKG_CONFIG_PATH:/opt/X11/lib/pkgconfig"

# set haxe std path
export HAXE_STD_PATH="$(brew --prefix)/lib/haxe/std"

# add virtualenvwrapper
source `which virtualenvwrapper_lazy.sh`

# The next line updates PATH for the Google Cloud SDK.
source $HOME/google-cloud-sdk/path.bash.inc

# The next line enables bash completion for gcloud.
source $HOME/google-cloud-sdk/completion.bash.inc

# We need a bigger file descriptor limit
ulimit -n 10000

# Some usefuls Git aliases
alias gco='git checkout '
alias gs='git status '
alias ga='git add '
alias gb='git branch '
alias gc='git commit'
alias gd='git diff'
alias gx='gitx --all'

# Instead of the obnoxious lime setup
alias lime='haxelib run lime '

# Stupid alias to get gcutil to work
alias gcutil='python2.6 `which gcutil` '

# A hack to get subl to work
alias subl='open -a "Sublime Text" '
alias s='subl '

# bash completions
source $(brew --prefix)/etc/bash_completion
__git_complete gco _git_checkout
__git_complete gd _git_diff
__git_complete gc _git_commit
__git_complete ga _git_add
__git_complete gs _git_status
__git_complete gb _git_branch

# initialize nvm
source $(brew --prefix nvm)/nvm.sh

# awscli completion
complete -C aws_completer aws
