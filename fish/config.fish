# Remove fish_greeting
set fish_greeting

####### Environment Variables #######
# Ensure homebrew programs will be used before system-provided programs
set --universal fish_user_paths /usr/local/bin $fish_user_paths

# Disabling bytecode (.pyc) files
set --global --export PYTHONDONTWRITEBYTECODE 1

# Set locale
set --global --export LC_ALL en_US.UTF-8
set --global --export LANG en_US.UTF-8

# Set EDITOR
set --global --export EDITOR vim

# Configuration for Powerline
set --global --export POWERLINE_ROOT_REPO /usr/local/lib/python2.7/site-packages
set fish_function_path $fish_function_path "$POWERLINE_ROOT_REPO/powerline/bindings/fish"
powerline-daemon --quiet
powerline-setup

# Configuration for Oh-My-Fish!
set -q XDG_DATA_HOME
    and set -gx OMF_PATH "$XDG_DATA_HOME/omf"
    or set -gx OMF_PATH "$HOME/.local/share/omf"
source $OMF_PATH/init.fish

