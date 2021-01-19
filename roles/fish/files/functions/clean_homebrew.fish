function clean_homebrew
    set --local TAP  $DOTFILES_REPO/roles/homebrew/files/tap
    set --local BREW $DOTFILES_REPO/roles/homebrew/files/brew
    set --local CASK $DOTFILES_REPO/roles/homebrew/files/cask
    set --local MAS  $DOTFILES_REPO/roles/homebrew/files/mas

    cat $TAP $BREW $CASK $MAS | brew bundle cleanup --force --file=-
end
