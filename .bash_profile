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
#!/bin/bash
# Load .bashrc if it exists
if [ -f "$HOME/.bashrc" ]; then
    source "$HOME/.bashrc"
fi

# Homebrew settings
export HOMEBREW_PREFIX="/opt/homebrew"
export HOMEBREW_CELLAR="/opt/homebrew/Cellar"
export HOMEBREW_REPOSITORY="/opt/homebrew"
export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:$PATH"
export MANPATH="/opt/homebrew/share/man:$MANPATH"
export INFOPATH="/opt/homebrew/share/info:$INFOPATH"

# Initialize Homebrew environment
eval "$(/opt/homebrew/bin/brew shellenv)"

# MacPorts settings
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
export MANPATH="/opt/local/share/man:$MANPATH"

# Add Visual Studio Code (code) to PATH
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

# Pyenv settings
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/shims:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"

# Ruby with rbenv
if command -v rbenv >/dev/null; then
    eval "$(rbenv init -)"
fi

# Virtualenvwrapper settings
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Devel
export VIRTUALENVWRAPPER_PYTHON="/opt/homebrew/bin/python3"

# Load nvm if installed
export NVM_DIR="$HOME/.nvm"
[ -s "$HOME/opt/homebrew/opt/nvm/nvm.sh" ] && \. "$HOME/opt/homebrew/opt/nvm/nvm.sh"
[ -s "$HOME/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"

# Ruby environment with chruby
source /opt/homebrew/opt/chruby/share/chruby/chruby.sh
source /opt/homebrew/opt/chruby/share/chruby/auto.sh
chruby ruby-3.1.3

# Source additional configurations
if [ -f "/opt/homebrew/etc/profile.d/bash_completion.sh" ]; then
    source "/opt/homebrew/etc/profile.d/bash_completion.sh"
fi

. "$HOME/.cargo/env"

# Set PATH for specific tools
export PATH="$HOME/httrack_install/bin:$PATH"
# Ensure PATH is clean and correctly set up
# Ensure PATH is clean and correctly set up
eval 'PATH="$(bash --norc -ec '\''IFS=:; paths=($PATH);
for i in ${!paths[@]}; do
  if [[ ${paths[i]} == "$HOME/.pyenv/shims" ]]; then
    unset '\''paths[i]'\'';
  fi;
done;
echo '${paths[*]}"'\')"'
export PATH="$HOME/.pyenv/shims:${PATH}"
source "/Users/adriot/.local/share/dorothy/init.sh" # Dorothy
