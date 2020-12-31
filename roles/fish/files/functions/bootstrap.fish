function bootstrap --wraps "ansible-playbook"
    sudo --validate
    ansible-playbook --inventory $DOTFILES_REPO/hosts.ini $DOTFILES_REPO/bootstrap.yml $argv
end
