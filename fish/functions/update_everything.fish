function update_everything
    sudo --validate

    pull_repos

    clean_homebrew
    update_homebrew

    pip-compile --quiet --upgrade $DOTFILES_REPO/pip/requirements.in
    pip-sync $DOTFILES_REPO/pip/requirements.txt | grep --invert-match "Everything up-to-date"

    yarn global upgrade --silent 2>&1 | grep --invert-match warning

    fisher update 1>/dev/null

    tldr --update

    ~/.tmux/plugins/tpm/bin/./clean_plugins
    ~/.tmux/plugins/tpm/bin/./update_plugins all 1>/dev/null

    vim +PluginClean  +qall
    vim +PluginUpdate +qall
end
