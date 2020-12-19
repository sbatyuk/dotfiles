function pull_repos
    set --local REPOS (find ~/repos/ -type d -maxdepth 1 -mindepth 1)

    parallel --verbose --linebuffer -j (count $REPOS) git -C {} pull ::: $REPOS
end
