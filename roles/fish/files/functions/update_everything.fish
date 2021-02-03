function update_everything
    sudo --validate

    pull_repos

    clean_homebrew
    update_homebrew

    fisher update 1>/dev/null

    tldr --update

    nvim --headless +PlugClean! +qall
    nvim --headless +PlugUpdate +qall
end
