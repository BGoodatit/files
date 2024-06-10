#!/bin/bash

# Source .bashrc if it exists
if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi

# Set default editor
export EDITOR="code -w"

# Set locale
export LC_CTYPE="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

# Homebrew configuration
export HOMEBREW_PREFIX="/opt/homebrew"
export HOMEBREW_CELLAR="/opt/homebrew/Cellar"
export HOMEBREW_REPOSITORY="/opt/homebrew"
export PATH="$HOMEBREW_PREFIX/bin:$HOMEBREW_PREFIX/sbin:$PATH"
export MANPATH="$HOMEBREW_PREFIX/share/man${MANPATH+:$MANPATH}:"
export INFOPATH="$HOMEBREW_PREFIX/share/info:${INFOPATH:-}"

# Adding Homebrew's sbin to system paths for binaries not symlinked to /usr/local
export PATH="/usr/local/sbin:$PATH"

# Custom and system binaries
export PATH="$HOME/bin:/usr/local/bin:/usr/bin:$PATH"

# For faster compilation (if ccache is used)
export PATH="/opt/homebrew/opt/ccache/libexec:$PATH"

# Python environment setup
export WORKON_HOME="$HOME/.virtualenvs"
export PROJECT_HOME="$HOME/Devel"
export VIRTUALENVWRAPPER_PYTHON="/opt/homebrew/bin/python3"
source /opt/homebrew/bin/virtualenvwrapper.sh

# Ruby environment setup with chruby
source /opt/homebrew/opt/chruby/share/chruby/chruby.sh
source /opt/homebrew/opt/chruby/share/chruby/auto.sh
chruby ruby-3.1.3

# Node Version Manager setup
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# ASDF version manager setup
. /opt/homebrew/opt/asdf/libexec/asdf.sh

# Pyenv setup
export PYENV_ROOT="$HOME/.pyenv"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"

# Add .NET Core to PATH
export PATH="$PATH:$HOME/dotnet"
export DOTNET_ROOT="$HOME/dotnet"

# Homebrew bash completion setup
if type brew &>/dev/null; then
  HOMEBREW_PREFIX="$(brew --prefix)"
  if [[ -r "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh" ]]; then
    source "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh"
  else
    for COMPLETION in "${HOMEBREW_PREFIX}/etc/bash_completion.d/"*; do
      [[ -r "${COMPLETION}" ]] && source "${COMPLETION}"
    done
  fi
fi

# Bash-completion
if [ -f "$(brew --prefix)/etc/bash_completion" ]; then
  . "$(brew --prefix)/etc/bash_completion"
fi

# iTerm2 shell integration
# [[ -e "${HOME}/.iterm2_shell_integration.bash" ]] && source "${HOME}/.iterm2_shell_integration.bash"

# Alias definitions
alias edit="code ~/.bash_profile"
alias ll="ls -lGaf"
alias shutdown="say 'As you wish sir.'; sudo shutdown -h now"
alias restart="sudo shutdown -r now && say 'The system has been restarted, Sir. We are online and ready to resume.'"
alias DEBUG="echo 'loaded .bash_profile'"
alias updateall="brew update && brew upgrade; say 'As you wish sir.'"
alias expresso="brew update --verbose && brew doctor && brew upgrade --verbose && brew cleanup"

# Function to open Visual Studio Code
code() { VSCODE_CWD="$PWD" open -n -b "com.microsoft.VSCode" --args "$@"; }
# Set up fzf key bindings and fuzzy completion
eval "$(fzf --bash)"eval "$(/opt/homebrew/bin/brew shellenv)"
eval "$(/opt/homebrew/bin/brew shellenv)"
