* Install Homebrew from [brew.sh](https://brew.sh)
* Install Ansible with [brew](https://formulae.brew.sh/formula/ansible)
* Clone dotfiles repository from [github](https://github.com/sam-hosseini/dotfiles)
* Setup fish shell
    ```
    ansible-playbook --ask-become-pass --tags fish bootstrap.yml
    ```
* Open a fish shell and execute `bootstrap`
* Execute the following functions:
  * `clone_repos`

* Enter licesne information of purchased applications
* Manually set [un-automatable shortcuts](https://github.com/sam-hosseini/dotfiles/blob/master/shortcuts/shortcuts.md#un-automatable-shortcuts)
