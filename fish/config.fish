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

source $DOTFILES_REPO/git/contact_info.fish
############################################################################
# PATH setup
############################################################################
set --local --append OWN_PATH /usr/local/bin                        # Where brew symlinks most packages
set --local --append OWN_PATH /usr/local/sbin                       # Where brew symlinks some packages
set --local --append OWN_PATH /usr/local/opt/ruby/bin               # Where brew's ruby lives
set --local --append OWN_PATH /usr/local/lib/ruby/gems/2.7.0/bin    # Where brew's ruby gems live

set --global --export fish_user_paths $OWN_PATH

############################################################################
# Fish theme influences only the colors of what you type
# starship controls fish prompt
############################################################################
starship init fish | source
