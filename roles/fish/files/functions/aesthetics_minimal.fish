function aesthetics_minimal
    set --local AESTHETICS_MINIMAL_ASCII $DOTFILES_REPO/neofetch/aesthetics_minimal_ascii
    set --local MODULES_TO_DISABLE cols users model distro song term shell cpu gpu memory

    neofetch --ascii $AESTHETICS_MINIMAL_ASCII --disable $MODULES_TO_DISABLE
end
