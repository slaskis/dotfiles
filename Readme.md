dotfiles
========

_These are my dotfiles. There are many like them but these ones are mine._

## Install

This was meant to be used with [thoughtbots rcm](https://github.com/thoughtbot/rcm).

1. Install homebrew

  ```
  ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
  ```

2. Install rcm

  ```
  brew tap thoughtbot/formulae
  brew install rcm
  ```

3. Install dotfiles

  ```
  rcup
  ```

## OSX WTF

The GUI applications in OSX has a fucked up PATH environment variable.

A little workaround is to do this:

```
# (in a terminal, which has set $PATH nicely from .bashrc)
launchctl setenv PATH $PATH
killall Dock && killall SystemUIServer && killall Finder
# now you can open your app!
```

_TODO: figure out a way for this to be done on boot_