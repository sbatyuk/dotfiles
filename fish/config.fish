############################################################################
# Environment Variables
############################################################################
set --global --export HOMEBREW_BUNDLE_NO_LOCK true
set --global --export HOMEBREW_NO_AUTO_UPDATE true
set --global --export EDITOR vim
set --global --export PYTHONDONTWRITEBYTECODE true
set --global --export PYTHONUNBUFFERED true
set --global --export fish_greeting ''
set --global --export HOMEBREW_CASK_OPTS "--no-quarantine"
set --global --export LC_ALL en_US.UTF-8 # Set locale
set --global --export LANG en_US.UTF-8   # Set locale
set --global --export DOTFILES_REPO ~/repos/dotfiles
set --global --export BAT_THEME Dracula

source $DOTFILES_REPO/fish/path.fish
source $DOTFILES_REPO/git/contact_info.fish
source $DOTFILES_REPO/starship/initializer.fish
