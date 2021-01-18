function update_everything
    sudo --validate

    pull_repos

    clean_homebrew
    update_homebrew

    fisher update 1>/dev/null

    tldr --update

    ~/.tmux/plugins/tpm/bin/./clean_plugins
    ~/.tmux/plugins/tpm/bin/./update_plugins all 1>/dev/null

    vim +PluginClean  +qall
    vim +PluginUpdate +qall
end
