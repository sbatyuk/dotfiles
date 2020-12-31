function clean_hosts_file
    sudo cp $DOTFILES_REPO/hosts/base_hosts_file /etc/hosts
    less /etc/hosts
end
