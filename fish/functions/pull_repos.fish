function pull_repos
    find ~/personal/ -type d -maxdepth 1 -mindepth 1 -exec git -C {} pull \;
end
