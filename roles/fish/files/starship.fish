set --global --export STARSHIP_CONFIG           $DOTFILES_REPO/roles/fish/files/starship.toml

starship init fish | source
