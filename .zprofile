#!/bin/zsh
# Homebrew environment variables
export HOMEBREW_PREFIX="/opt/homebrew"
export HOMEBREW_CELLAR="/opt/homebrew/Cellar"
export HOMEBREW_REPOSITORY="/opt/homebrew"
export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:$PATH"
export MANPATH="/opt/homebrew/share/man:$MANPATH"
export INFOPATH="/opt/homebrew/share/info:$INFOPATH"

# Initialize Homebrew environment
eval "$(/opt/homebrew/bin/brew shellenv)"

# Setting PATH for Python 3.12
# The original version is saved in .zprofile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.12/bin:${PATH}"
export PATH

# Add Visual Studio Code (code) to PATH
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

# MacPorts Installer addition on 2024-01-21_at_04:33:30: adjusting PATH and MANPATH for MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
export MANPATH="/opt/local/share/man:$MANPATH"
# Finished adapting your environment variables for use with MacPorts.

# Your previous /Users/adriot/.zprofile file was backed up as /Users/adriot/.zprofile.macports-saved_2024-01-21_at_04:33:30
source ~/.zshrc
neofetch | lolcat

eval "$(/usr/local/bin/brew shellenv)"
eval $(/opt/homebrew/bin/brew shellenv)
eval $(/opt/homebrew/bin/brew shellenv)
eval $(/opt/homebrew/bin/brew shellenv)

# Setting PATH for Python 3.12
# The original version is saved in .zprofile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.12/bin:${PATH}"
export PATH

eval "$(/opt/homebrew/bin/brew shellenv)"
# Add Visual Studio Code (code)
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

eval "$(/usr/local/bin/brew shellenv)"
eval $(/opt/homebrew/bin/brew shellenv)
eval $(/opt/homebrew/bin/brew shellenv)
eval $(/opt/homebrew/bin/brew shellenv)
