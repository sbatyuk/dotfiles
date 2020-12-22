function update_everything
    sudo -v

    echo -e '####################################\n# Pull repos \n####################################'
    pull_repos

    echo -e '####################################\n# Software Update \n####################################'
    sudo softwareupdate --install --all

    echo -e '####################################\n# Brew \n####################################'
    clean_homebrew
    update_homebrew

    echo -e '####################################\n# Pip \n####################################'
    pip-sync $DOTFILES_REPO/pip/requirements.txt

    echo -e '####################################\n# Yarn \n####################################'
    yarn global upgrade --silent 2>&1 | rg --invert-match warning

    echo -e '####################################\n# Fisher \n####################################'
    fisher update

    echo -e '####################################\n# TLDR \n####################################'
    tldr --update

    echo -e '####################################\n# Done \n####################################'
end
