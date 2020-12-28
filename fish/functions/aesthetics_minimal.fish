function aesthetics_minimal
    set --local SYMBOL_ASCII_MINIMAL $DOTFILES_REPO/neofetch/symbol_ascii_minimal
    set --local MODULES_TO_DISABLE cols users model distro song term shell cpu gpu memory

    neofetch --ascii $SYMBOL_ASCII_MINIMAL --disable $MODULES_TO_DISABLE
end
