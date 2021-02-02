function bootstrap --wraps "ansible-playbook"
    sudo --validate
    ansible-playbook $DOTFILES_REPO/roles/ansible/files/bootstrap.yml $argv
end
