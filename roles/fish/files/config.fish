set --global --export DOTFILES_REPO ~/repos/dotfiles

source $DOTFILES_REPO/roles/fish/files/environment.fish
source $DOTFILES_REPO/roles/fish/files/path.fish
source $DOTFILES_REPO/git/contact_info.fish
source $DOTFILES_REPO/homebrew/environment.fish
source $DOTFILES_REPO/starship/initializer.fish
