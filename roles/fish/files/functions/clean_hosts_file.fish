function clean_hosts_file
    sudo cp $DOTFILES_REPO/roles/hosts/files/base_hosts_file /private/etc/hosts
    less /etc/hosts
end
