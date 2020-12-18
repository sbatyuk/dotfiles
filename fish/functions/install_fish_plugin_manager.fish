function install_fish_plugin_manager
    clear
    curl --silent --location https://git.io/fisher | source && fisher install jorgebucaran/fisher
end
