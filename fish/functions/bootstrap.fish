function bootstrap
    sudo --validate
    ansible-playbook --inventory $DOTFILES_REPO/hosts.ini $DOTFILES_REPO/bootstrap.yml
end
