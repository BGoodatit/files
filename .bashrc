#!/bin/bash
# Alias definitions
alias cp='cp -rv'
alias ls='ls -lGAF'  # macOS `ls`
alias mv='mv -v'
alias mkdir='mkdir -pv'
alias editbp="code ~/.bash_profile"
alias restart="sudo shutdown -r now && say 'The system has been restarted, Sir. We are online and ready to resume.'"

# Homebrew updates
alias brewup="brew update --verbose && brew upgrade --verbose && brew cleanup"

# Custom functions
function blastoff(){
    echo "🚀"
}

# Set terminal window title
function set_win_title(){
    echo -ne "\033]0;$(basename "$PWD")\007"
}

# Initialize Starship prompt, if installed
if [ -f "$HOME/.cargo/bin/starship" ]; then
    eval "$("$HOME/.cargo/bin/starship" init bash)"
fi

# Load NVM, Node Version Manager
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
source "/Users/adriot/.local/share/dorothy/init.sh" # Dorothy
