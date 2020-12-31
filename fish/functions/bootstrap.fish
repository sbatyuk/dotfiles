function bootstrap
    ansible-playbook --inventory $DOTFILES_REPO/hosts.ini $DOTFILES_REPO/bootstrap.yml
end
