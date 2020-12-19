function clone_repos
    1password_session
    set --local GITLAB_TOKEN (op get item terraform | jq --raw-output '.details.sections[1].fields[0].v')

    set --local GITLAB_GROUP_ID 4665787
    set --local GITLAB_GROUP_URL https://gitlab.com/api/v4/groups/$GITLAB_GROUP_ID
    set --local HEADER "PRIVATE-TOKEN: $GITLAB_TOKEN"
    set --local RESPONSE (http --body $GITLAB_GROUP_URL $HEADER)
    set --local REPOS_SSH_URLS (echo $RESPONSE | jq --raw-output '.projects[].ssh_url_to_repo')

    for repo in $REPOS_SSH_URLS
        git -C ~/repos clone $repo
    end
end
