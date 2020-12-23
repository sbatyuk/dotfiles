function update_everything
    sudo -v

    pull_repos

    clean_homebrew
    update_homebrew

    pip-sync $DOTFILES_REPO/pip/requirements.txt | grep --invert-match "Everything up-to-date"

    yarn global upgrade --silent 2>&1 | grep --invert-match warning

    fisher update 1>/dev/null

    tldr --update
end
