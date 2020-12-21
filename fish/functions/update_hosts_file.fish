function update_hosts_file
    bash -c '
    source $DOTFILES_REPO/bootstrap.sh --source-only
    update_hosts_file
    '
    less /etc/hosts
end
