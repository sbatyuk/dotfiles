function pull_repos
    find ~/repos/ -type d -maxdepth 1 -mindepth 1 -exec git -C {} pull \;
end
