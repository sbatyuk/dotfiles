function hh
    bash -c '
    source ~/personal/dotfiles/bootstrap.sh --source-only
    update_hosts_file
    '
    less /etc/hosts
end
