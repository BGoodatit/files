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

# MacPorts Installer addition on 2024-01-21_at_04:33:30: adjusting PATH and MANPATH for MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
export MANPATH="/opt/local/share/man:$MANPATH"

# Add Visual Studio Code (code) to PATH
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

# Setting PATH for Python 3.12
PATH="/Library/Frameworks/Python.framework/Versions/3.12/bin:$PATH"
export PATH

# Python environment management with pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/shims:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init --path)"
  eval "$(pyenv init -)"
fi

# Ruby environment management with rbenv
if command -v rbenv >/dev/null; then
  eval "$(rbenv init -)"
fi

# Alias python to python3
alias python="python3"

# Source additional configurations
source ~/.zshrc
source '/Users/adriot/.local/share/dorothy/init.sh' # Dorothy
