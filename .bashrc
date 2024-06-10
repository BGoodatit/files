#!/bin/bash

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# Set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ]; then
    PATH="$HOME/bin:$PATH"
fi

# Set up the prompt with a rocket ship
PS1='\[\e[0;32m\]\u@\h \[\e[0;34m\]\w 🚀 \[\e[0m\] \$ '

# Aliases

alias ll='ls -la'
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias gpl='git pull'
alias vsc='code .'
alias cp='cp -rv'
alias ls='ls -lGAF' # macOS `ls`
alias mv='mv -v'
alias mkdir='mkdir -pv'
alias editbp="code ~/.bash_profile"
alias shutdown="say 'As you wish sir.'; sudo shutdown -h now"
alias restart="sudo shutdown -r now && say 'The system has been restarted, Sir. We are online and ready to resume.'"
alias DEBUG="echo 'loaded .bashrc'"
alias updateall="brew update && brew upgrade; say 'As you wish sir.'"
alias expresso="brew update --verbose && brew doctor && brew upgrade --verbose && brew cleanup"
alias brewup="brew update --verbose && brew upgrade --verbose && brew cleanup"
#   cleanupDS:  Recursively delete .DS_Store files
#   -------------------------------------------------------------------
alias cleanupDS="find . -type f -name '*.DS_Store' -ls -delete"
#   -------------------------------------------------------------------
#   finderShowHidden:   Show hidden files in Finder
alias findHidden='defaults write com.apple.finder ShowAllFiles TRUE'
#   finderHideHidden:   Hide hidden files in Finder
alias finderdefault='defaults write com.apple.finder ShowAllFiles FALSE'
#   -------------------------------------------------------------------
#   extract:  Extract most know archives with one command
#   ---------------------------------------------------------
extract() {
    if [ -f $1 ]; then
        case $1 in
        *.tar.bz2) tar xjf $1 ;;
        *.tar.gz) tar xzf $1 ;;
        *.bz2) bunzip2 $1 ;;
        *.rar) unrar e $1 ;;
        *.gz) gunzip $1 ;;
        *.tar) tar xf $1 ;;
        *.tbz2) tar xjf $1 ;;
        *.tgz) tar xzf $1 ;;
        *.zip) unzip $1 ;;
        *.Z) uncompress $1 ;;
        *.7z) 7z x $1 ;;
        *) echo "'$1' cannot be extracted via extract()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}
# Custom functions
function blastoff() {
    echo "🚀"
}
function set_win_title() {
    echo -ne "\033]0; $(basename "$PWD") \007"
}

# Choose one function to keep for starship prompt
starship_precmd_user_func="blastoff" # or "set_win_title"

# Environment setups
export SOFTWARE_UPDATE_AVAILABLE="📦"

# Enable color support for `ls` and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    eval "$(dircolors -b)"
    alias ls='ls --color=auto'
fi

# Load nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# Initialize Starship prompt, if installed
if [ -f "$HOME/.cargo/bin/starship" ]; then
    eval "$("$HOME/.cargo/bin/starship" init bash)"
fi

# Load additional custom scripts
if [ -d "$HOME/.bashrc.d" ]; then
    for rc in "$HOME/.bashrc.d/"*.sh; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi

# Starship prompt initialization
eval "$(starship init bash)"

# iTerm2 shell integration
# [[ -e "${HOME}/.iterm2_shell_integration.bash" ]] && source "${HOME}/.iterm2_shell_integration.bash"

# Function to open Visual Studio Code
code() { VSCODE_CWD="$PWD" open -n -b "com.microsoft.VSCode" --args "$@"; }

eval "$(thefuck --alias)"
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"

# Starship prompt
eval "$(starship init bash)"

# Function to set tab and window name to current directory and Git branch
set_tab_name() {
    echo -ne "\033]0;$(basename "$PWD") - $(git rev-parse --abbrev-ref HEAD 2>/dev/null || echo "No Git")\007"
}

# Update tab name dynamically with Starship
PROMPT_COMMAND='set_tab_name; $PROMPT_COMMAND'

# Starship prompt
eval "$(starship init bash)"

# Function to set tab name to current directory
set_tab_name() {
    echo -ne "\033]0;$(basename "$PWD")\007"
}

# Function to set window name to username and hostname
set_window_name() {
    echo -ne "\033]2;$USER@$HOSTNAME\007"
}

# Update tab and window name dynamically with Starship
PROMPT_COMMAND='set_tab_name; set_window_name; $PROMPT_COMMAND'

if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi

function_exists() {
    declare -f -F $1 >/dev/null
    return $?
}

for al in $(__git_get_config_variables "alias"); do
    alias g$al="git $al"
    complete_func=_git_$(__git_aliased_command $al)
    function_exists $complete_fnc && __git_complete g$al $complete_func
done
