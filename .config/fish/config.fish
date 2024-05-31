set -U fish_user_paths $HOME/.cargo/bin $fish_user_paths
# Homebrew autojump integration
source /opt/homebrew/share/autojump/autojump.fish
set -gx HOMEBREW_PREFIX /opt/homebrew
set -gx HOMEBREW_CELLAR /opt/homebrew/Cellar
set -gx HOMEBREW_REPOSITORY /opt/homebrew
#Corrected the PATH concatenation
set -gx PATH /opt/homebrew/bin:/opt/homebrew/sbin:$PATH
# Simplified MANPATH setting
set -gx MANPATH /opt/homebrew/share/man:$MANPATH
set -gx INFOPATH /opt/homebrew/share/info:$INFOPATH
# Correctly setting Pyenv
set -gx PYENV_ROOT "$HOME/.pyenv"
pyenv init --path | source
pyenv init - | source
set -gx PATH "$HOME/.rbenv/bin" $PATH
# status --is-interactive; and source (rbenv init -|psub)
eval "$(rbenv init -)"

# Chruby Initialization
# Set up Ruby environment with chruby
if test -d /opt/homebrew/Cellar/chruby/0.3.9
    bass source /opt/homebrew/Cellar/chruby/0.3.9/share/chruby/chruby.sh
    bass source /opt/homebrew/Cellar/chruby/0.3.9/share/chruby/auto.sh
else
    echo "Chruby is not installed or the path is incorrect."
end
# Virtualenvwrapper configuration
set -gx WORKON_HOME $HOME/.virtualenvs
set -gx PROJECT_HOME $HOME/Devel
set -gx VIRTUALENVWRAPPER_PYTHON /opt/homebrew/bin/python3
set -U XDG_DATA_DIRS /opt/homebrew/share
# Setup NVM (Node Version Manager) with Bass, if installed
set -gx NVM_DIR "$HOME/.nvm"
if type bass >/dev/null 2>&1
    bass source (brew --prefix nvm)/nvm.sh
    bass source (brew --prefix nvm)/etc/bash_completion.d/nvm
else
    echo "Bass is not installed. NVM will not be available."
end
#set universal httrack path
set -Ux PATH $HOME/httrack_install/bin $PATH
#httrack set path
# set -x PATH $HOME/httrack_install/bin $PATH
# Set up Homebrew environment
set -gx HOMEBREW_PREFIX /opt/homebrew
set -gx HOMEBREW_CELLAR /opt/homebrew/Cellar
set -gx HOMEBREW_REPOSITORY /opt/homebrew

# Update PATH for Homebrew
set -gx PATH /opt/homebrew/bin /opt/homebrew/sbin $PATH

# Simplify MANPATH and INFOPATH settings
set -gx MANPATH /opt/homebrew/share/man $MANPATH
set -gx INFOPATH /opt/homebrew/share/info $INFOPATH

# Set up Pyenv
set -gx PYENV_ROOT "$HOME/.pyenv"
pyenv init --path | source
pyenv init - | source

# Set up Ruby environment with chruby
if test -d /opt/homebrew/Cellar/chruby/0.3.9
    bass source /opt/homebrew/Cellar/chruby/0.3.9/share/chruby/chruby.sh
    bass source /opt/homebrew/Cellar/chruby/0.3.9/share/chruby/auto.sh
else
    echo "Chruby is not installed or the path is incorrect."
end

# Set up NVM with Bass, if installed
set -gx NVM_DIR "$HOME/.nvm"
if type bass >/dev/null 2>&1
    bass source (brew --prefix nvm)/nvm.sh
    bass source (brew --prefix nvm)/etc/bash_completion.d/nvm
else
    echo "Bass is not installed. NVM will not be available."
end

# Include other configurations and utilities
source /opt/homebrew/share/autojump/autojump.fish
set -U fish_user_paths $HOME/.cargo/bin $fish_user_paths
thefuck --alias | source

# Set up Virtualenvwrapper
set -gx WORKON_HOME $HOME/.virtualenvs
set -gx PROJECT_HOME $HOME/Devel
set -gx VIRTUALENVWRAPPER_PYTHON /opt/homebrew/bin/python3
# Custom Aliases
alias ll="ls -lGaf"
alias shutdown="say 'As you wish, sir.' ; sudo shutdown -h now"
alias restart="sudo shutdown -r now ; say 'The system has been restarted, Sir. We are online and ready to resume.'"
alias updateall="brew update && brew upgrade && brew cleanup; say 'Updates complete, sir.'"
alias expresso="brew update --verbose && brew doctor && brew upgrade --verbose && brew cleanup && brew cleanup -s"
alias checkup="brew update && brew upgrade && brew upgrade --cask && npm update -g && npm upgrade -g && gem update --system && softwareupdate --install --all && say 'System checkup complete, sir.' && brew cleanup -s"
alias activedock="defaults write com.apple.dock static-only -bool TRUE; killall Dock"
alias staticdock="defaults write com.apple.dock static-only -bool FALSE; killall Dock"
alias dock="defaults delete com.apple.dock; killall Dock"
alias brainfreeze="sudo systemsetup -setrestartfreeze on"
alias charging="defaults write com.apple.PowerChime ChimeOnAllHardware -bool true && \
    open /System/Library/CoreServices/PowerChime.app"
alias charged="defaults write com.apple.PowerChime ChimeOnAllHardware -bool false && \
    open /System/Library/CoreServices/PowerChime.app"
alias srcconfig="source ~/.config/fish/config.fish"
# Open files in their associated apps from Terminal.
abbr --add --global open 'xdg-open &>/dev/null '

# Git aliases to make git a bit more humane for everyday use.
abbr --add --global git-log 'git log --graph --decorate --pretty=oneline --abbrev-commit'
abbr --add --global git-log-dates 'git log --graph --decorate --pretty=format:"%h [%cr] %s'
abbr --add --global git-tag 'git tag -n'
abbr --add --global git-undo-last-commit 'git reset HEAD~'

function code
    set VSCODE_CWD "$PWD"
    open -n -b "com.microsoft.VSCode" --args $argv
end
function fish_greeting -d "Display a fish greeting with logos and versions"
    if type neofetch >/dev/null 2>&3
        neofetch --stdout | lolcat
    end
    # Display the fish logo with specified colors
    fish_logo blue cyan green
    echo -n

end
# asdf version manager
source /opt/homebrew/opt/asdf/libexec/asdf.fish
if test -s (brew --prefix asdf)/asdf.sh
    source (brew --prefix asdf)/asdf.sh
end
if string match -q "$TERM_PROGRAM" vscode
    . (code --locate-shell-integration-path fish)
end
function srcconfig
    source ~/.config/fish/config.fish
end
if test -d (brew --prefix)"/share/fish/completions"
    set -p fish_complete_path (brew --prefix)/share/fish/completions
end

if test -d (brew --prefix)"/share/fish/vendor_completions.d"
    set -p fish_complete_path (brew --prefix)/share/fish/vendor_completions.d
end


source ~/.iterm2_shell_integration.fish
# fish: Place this in ~/.config/fish/config.fish after the line
#"source ~/.iterm2_shell_integration.fish".

thefuck --alias | source
if status is-interactive

end
status --is-interactive; and source (pyenv init - | psub)
set -Ux fish_user_paths /Users/adriot/.pyenv/versions/venv/bin $fish_user_paths
alias python="python3"
set -Ux fish_user_paths /usr/local/opt/ruby/bin
status is-login; and source (pyenv init -|psub)

alias config '/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
source '/Users/adriot/.local/share/dorothy/init.fish' # Dorothy
