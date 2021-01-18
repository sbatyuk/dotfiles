* Install Homebrew from [brew.sh](https://brew.sh)
* Install Ansible with [brew](https://formulae.brew.sh/formula/ansible)
* Clone dotfiles repository from [github](https://github.com/sam-hosseini/dotfiles)
* Setup fish shell
    ```
    ansible-playbook --ask-become-pass --tags fish bootstrap.yml
    ```
* Open a fish shell and execute `bootstrap`
