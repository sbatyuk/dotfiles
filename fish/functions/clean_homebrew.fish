function clean_homebrew
    set --local TAP  $DOTFILES_REPO/homebrew/tap
    set --local BREW $DOTFILES_REPO/homebrew/brew
    set --local CASK $DOTFILES_REPO/homebrew/cask
    set --local MAS  $DOTFILES_REPO/homebrew/mas

    cat $TAP $BREW $CASK $MAS | brew bundle cleanup --force --file=-
end
