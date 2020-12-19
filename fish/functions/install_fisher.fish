function install_fisher
    set --local FISH_PLUGINS (cat $DOTFILES_REPO/fish/fish_plugins)

    curl --silent --location https://git.io/fisher | source
    fisher install $FISH_PLUGINS
end
