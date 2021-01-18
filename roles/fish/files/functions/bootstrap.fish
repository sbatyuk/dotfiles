function bootstrap --wraps "ansible-playbook"
    sudo --validate
    ansible-playbook $DOTFILES_REPO/bootstrap.yml $argv
end
