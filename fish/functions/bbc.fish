function bbc
    set --local TAP  ~/personal/dotfiles/homebrew/tap
    set --local BREW ~/personal/dotfiles/homebrew/brew
    set --local CASK ~/personal/dotfiles/homebrew/cask
    set --local MAS  ~/personal/dotfiles/homebrew/mas

    set --local ALL_PACKAGES ~/personal/dotfiles/homebrew/all_packages

    cat $TAP $BREW $CASK $MAS > $ALL_PACKAGES
    brew bundle cleanup --file=$ALL_PACKAGES --force 2>&1 | ack --invert-match 'For the cask, use'
    rm $ALL_PACKAGES
end
