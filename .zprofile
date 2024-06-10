#!/bin/zsh

# Source .zshrc if it exists
if [ -f ~/.zshrc ]; then
  echo "Sourcing .zshrc from .zprofile"
  source ~/.zshrc
fi

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
export PATH="/Library/Frameworks/Python.framework/Versions/3.12/bin:${PATH}"

# Add Visual Studio Code (code) to PATH
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

# MacPorts Installer addition on 2024-01-21_at_04:33:30: adjusting PATH and MANPATH for MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
export MANPATH="/opt/local/share/man:$MANPATH"

# Initialize pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/shims:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"
eval "$(rbenv init -)"

# Set up fzf key bindings and fuzzy completion
if type fzf &>/dev/null; then
  source "$(brew --prefix)/opt/fzf/shell/key-bindings.zsh"
  source "$(brew --prefix)/opt/fzf/shell/completion.zsh"
fi

# Display system information on login
neofetch | lolcat
