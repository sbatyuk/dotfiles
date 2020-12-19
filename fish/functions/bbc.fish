function bbc
    set --local TAP  $DOTFILES_REPO/homebrew/tap
    set --local BREW $DOTFILES_REPO/homebrew/brew
    set --local CASK $DOTFILES_REPO/homebrew/cask
    set --local MAS  $DOTFILES_REPO/homebrew/mas

    set --local ALL_PACKAGES $DOTFILES_REPO/homebrew/all_packages

    cat $TAP $BREW $CASK $MAS > $ALL_PACKAGES
    brew bundle cleanup --file=$ALL_PACKAGES --force 2>&1 | ack --invert-match 'For the cask, use'
    rm $ALL_PACKAGES
end
