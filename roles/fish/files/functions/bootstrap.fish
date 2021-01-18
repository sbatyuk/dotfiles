function bootstrap --wraps "ansible-playbook"
    sudo --validate
    ansible-playbook $DOTFILES_REPO/ansible/bootstrap.yml $argv
end
