############################################################################
# Environment Variables
############################################################################
set --global --export GIT_GLOBAL_NAME  "Sam Hosseini"
set --global --export GIT_GLOBAL_EMAIL "git-email@hosseini.io"
set --global --export GIT_AUTHOR_NAME     $GIT_GLOBAL_NAME
set --global --export GIT_COMMITTER_NAME  $GIT_GLOBAL_NAME
set --global --export GIT_AUTHOR_EMAIL    $GIT_GLOBAL_EMAIL
set --global --export GIT_COMMITTER_EMAIL $GIT_GLOBAL_EMAIL
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

############################################################################
# PATH setup
############################################################################
# /usr/local/bin is where brew symlinks most executables it installs
# /usr/local/sbin is where brew symlinks some of its executables
# /usr/local/opt/ruby/bin is where the symlinked brew Ruby executable lives
# By putting these paths before $fish_user_paths, they will take precedence
# over system provided programs
set --global --export fish_user_paths \
    /usr/local/opt/python@3.9/bin \
    /usr/local/bin \
    /usr/local/sbin \
    /usr/local/opt/ruby/bin \
    /usr/local/lib/ruby/gems/2.6.0/bin \
    $fish_user_paths

############################################################################
# Fish theme influences only the colors of what you type
# starship controls fish prompt
############################################################################
starship init fish | source
